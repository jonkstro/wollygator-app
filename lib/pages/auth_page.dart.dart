import 'package:flutter/material.dart';
import 'package:wolly_team/components/auth_form_widget.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('login'),
        ),
        body: const Center(child: AuthFormWidget()));
  }
}
