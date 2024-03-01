import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wolly_team/core/models/auth_form_model.dart';

// StatefulWidget personalizado para uma animação de virada entre os formulários de login e cadastro
class AuthFormFlipAnimation extends StatefulWidget {
  const AuthFormFlipAnimation({
    Key? key, // Parâmetro Key para widgets Flutter
    required this.formData, // Modelo de dados para o formulário de autenticação
    required this.loginForm, // Widget para o formulário de login
    required this.signupForm, // Widget para o formulário de cadastro
  }) : super(key: key);

  final AuthFormModel formData; // Dados do formulário de autenticação
  final Widget loginForm; // Widget para o formulário de login
  final Widget signupForm; // Widget para o formulário de cadastro

  @override
  State<AuthFormFlipAnimation> createState() => _AuthFormFlipAnimationState();
}

// Construtor de transição personalizado para a animação de virada
Widget __transitionBuilder(
  Widget widget,
  Animation<double> animation,
  bool showFrontSide,
) {
  // Tween para a animação de rotação
  final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);

  // AnimatedBuilder para transformações dinâmicas durante a animação
  return AnimatedBuilder(
    animation: rotateAnim,
    builder: (context, child) {
      final isUnder = (ValueKey(showFrontSide) !=
          widget.key); // Verifica se o widget está abaixo ou acima
      var tilt = ((animation.value - 0.5).abs() - 0.5) *
          0.003; // Calcula o efeito de inclinação
      tilt *=
          isUnder ? -1.0 : 1.0; // Ajusta a inclinação com base na orientação
      final value = isUnder
          ? min(rotateAnim.value, pi / 2)
          : min(pi / 2, rotateAnim.value); // Limita o valor de rotação

      // Aplica a transformação de rotação e inclinação ao widget
      return Transform(
        transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
        alignment: Alignment.center,
        child: widget,
      );
    },
  );
}

// Classe de estado para AuthFormFlipAnimation
class _AuthFormFlipAnimationState extends State<AuthFormFlipAnimation> {
  @override
  Widget build(BuildContext context) {
    // AnimatedSwitcher para alternar entre os formulários de login e cadastro
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000), // Duração da animação
      switchInCurve: Curves.easeInBack, // Curva para a animação "in"
      switchOutCurve: Curves.easeInBack.flipped, // Curva para a animação "out"
      child: widget
              .formData.isLogin // Verifica se o formulário de login está ativo
          ? widget.loginForm // Exibe o formulário de login
          : widget.signupForm, // Exibe o formulário de cadastro
      layoutBuilder: (child, list) => Stack(
        children: [child!, ...list],
      ),
      // Construtor de transição personalizado para o efeito de virada
      transitionBuilder: (Widget child, Animation<double> animation) =>
          __transitionBuilder(
        child,
        animation,
        widget.formData.isLogin, // Passa o estado atual do formulário de login
      ),
    );
  }
}
