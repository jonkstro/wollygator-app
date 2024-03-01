import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wolly_team/components/auth_form_container.dart';
import 'package:wolly_team/core/models/auth_form_model.dart';

class SignupForm extends StatefulWidget {
  SignupForm({
    super.key,
    required this.toggleAuthMode,
    required this.formData,
  });
  final void Function() toggleAuthMode;
  AuthFormModel formData;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return AuthFormContainer(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              'Registre-se',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person),
            ),
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            style: Theme.of(context).textTheme.labelSmall,
            onChanged: (value) => widget.formData.name = value,
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
          Container(
            margin: const EdgeInsets.all(12),
            width: double.infinity,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 5,
              ),
              icon: const Icon(Icons.navigate_next),
              label: const Text('Próximo'),
              onPressed: () {
                print('------ LOGAR ------');
                print(widget.formData.name);
                print(widget.formData.email);
                print(widget.formData.password);
                print('------ LOGAR ------');
              },
            ),
          ),
          const Spacer(),
          const Divider(
            height: 0.25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'Já tem uma conta?',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              TextButton(
                onPressed: widget.toggleAuthMode,
                child: const Text('Fazer Login'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
