import 'package:cmp_app/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            //width: 90,
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            //width: 90,
            child: TextFormField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Apellido'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            //width: 90,
            child: TextFormField(
              controller: emailController,
              decoration:
                  const InputDecoration(labelText: 'Correo electrónico'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            //width: 90,
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            //width: 90,
            child: TextFormField(
              controller: passwordConfirmController,
              obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              decoration:
                  const InputDecoration(labelText: 'Confirmar contraseña'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                context.read<AuthenticationService>().register(
                    name: nameController.text,
                    lastName: lastNameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                    passwordConfirmed: passwordConfirmController.text);
              },
              child: const Text('Registrar')),
        ],
      )),
    );
  }
}
