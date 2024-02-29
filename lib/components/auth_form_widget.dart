import 'package:flutter/material.dart';
import 'package:wolly_team/components/auth_form_container.dart';
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
    return AuthFormContainer(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
              ),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
              ),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const Spacer(),
          TextButton(
            onPressed: widget.toggleAuthMode,
            child: const Text('Fazer Login'),
          ),
        ],
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
    return AuthFormContainer(
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
              ),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const Spacer(),
          TextButton(
            onPressed: widget.toggleAuthMode,
            child: const Text('Fazer registro'),
          ),
        ],
      ),
    );
  }
}
