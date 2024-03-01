import 'package:flutter/material.dart';
import 'package:wolly_team/components/auth_form_flip_animation.dart';
import 'package:wolly_team/components/signin_form_widget.dart';
import 'package:wolly_team/components/signup_form_widget.dart';
import 'package:wolly_team/core/models/auth_form_model.dart';

class AuthFormWidget extends StatefulWidget {
  const AuthFormWidget({super.key});

  @override
  State<AuthFormWidget> createState() => _AuthFormWidgetState();
}

class _AuthFormWidgetState extends State<AuthFormWidget> {
  final _formData = AuthFormModel();
  final _formKey = GlobalKey<FormState>();

  void _toggleAuthMode() {
    setState(() {
      _formData.name = '';
      _formData.email = '';
      _formData.password = '';
      _formData.toggleAuthMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AuthFormFlipAnimation(
        formData: _formData,
        loginForm: LoginForm(
          formData: _formData,
          toggleAuthMode: _toggleAuthMode,
        ),
        signupForm: SignupForm(
          toggleAuthMode: _toggleAuthMode,
          formData: _formData,
        ),
      ),
    );
  }
}
