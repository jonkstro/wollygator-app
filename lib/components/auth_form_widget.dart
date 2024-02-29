import 'package:flutter/material.dart';
import 'package:wolly_team/components/auth_form_flip_animation.dart';
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
      _formData.toggleAuthMode();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 600,
      height: 400,
      child: Form(
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
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({
    super.key,
    required this.toggleAuthMode,
    required this.formData,
  });
  final void Function() toggleAuthMode;
  final AuthFormModel formData;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 400,
      child: Card(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Name'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Confirm Password'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const Spacer(),
            TextButton(
              onPressed: widget.toggleAuthMode,
              child: const Text('Fazer Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required this.formData,
    required this.toggleAuthMode,
  });

  final AuthFormModel formData;
  final void Function() toggleAuthMode;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      height: 400,
      child: Card(
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(labelText: 'Email'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Password'),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            const Spacer(),
            TextButton(
              onPressed: widget.toggleAuthMode,
              child: const Text('Fazer registro'),
            ),
          ],
        ),
      ),
    );
  }
}
