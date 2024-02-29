import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wolly_team/core/models/auth_form_model.dart';

class AuthFormFlipAnimation extends StatefulWidget {
  const AuthFormFlipAnimation(
      {super.key,
      required this.formData,
      required this.loginForm,
      required this.signupForm});
  final AuthFormModel formData;
  final Widget loginForm;
  final Widget signupForm;

  @override
  State<AuthFormFlipAnimation> createState() => _AuthFormFlipAnimationState();
}

Widget __transitionBuilder(
  Widget widget,
  Animation<double> animation,
  bool showFrontSide,
) {
  final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);

  return AnimatedBuilder(
      animation: rotateAnim,
      builder: (context, child) {
        final isUnder = (ValueKey(showFrontSide) != widget.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value = isUnder
            ? min(rotateAnim.value, pi / 2)
            : min(pi / 2, rotateAnim.value);

        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          alignment: Alignment.center,
          child: widget,
        );
      });
}

class _AuthFormFlipAnimationState extends State<AuthFormFlipAnimation> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 1000),
      switchInCurve: Curves.easeInBack,
      switchOutCurve: Curves.easeInBack.flipped,
      child: widget.formData.isLogin ? widget.loginForm : widget.signupForm,
      layoutBuilder: (child, list) => Stack(
        children: [child!, ...list],
      ),
      transitionBuilder: (Widget child, Animation<double> animation) =>
          __transitionBuilder(
        child,
        animation,
        widget.formData.isLogin,
      ),
    );
  }
}
