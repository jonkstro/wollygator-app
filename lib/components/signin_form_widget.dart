import 'package:flutter/material.dart';
import 'package:wolly_team/components/auth_form_container.dart';
import 'package:wolly_team/core/models/auth_form_model.dart';

class LoginForm extends StatefulWidget {
  LoginForm({
    super.key,
    required this.formData,
    required this.toggleAuthMode,
  });

  AuthFormModel formData;
  final void Function() toggleAuthMode;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Variável para controlar a visibilidade da senha
  bool _hidePassword = true;
  bool _hideConfirmPassword = true;
  // Variável para continuar logado ou não
  bool _continueLoggedCheck = false;

  @override
  Widget build(BuildContext context) {
    return AuthFormContainer(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'Faça Login',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(Icons.email),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            style: Theme.of(context).textTheme.labelSmall,
            onChanged: (value) => widget.formData.email = value,
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
            onChanged: (value) => widget.formData.password = value,
          ),
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(12),
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 5,
              ),
              icon: const Icon(Icons.login),
              label: const Text('Logar'),
              onPressed: () {
                print('------ LOGAR ------');
                print(widget.formData.name);
                print(widget.formData.email);
                print(widget.formData.password);
                print('------ LOGAR ------');
              },
            ),
          ),
          const Divider(
            height: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Não possui uma conta ainda?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton(
                onPressed: widget.toggleAuthMode,
                child: const Text('Fazer registro'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
