import 'package:cmp_app/screens/register_screen.dart';
import 'package:cmp_app/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Iniciar sesión'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
              ElevatedButton(
                  onPressed: () {
                    context.read<AuthenticationService>().signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        context: context);
                  },
                  child: const Text('Iniciar sesión')),
              const TextButton(
                  onPressed: null, child: Text('¿Olvidó su contraseña?')),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: const Text('Registrarse')),
            ],
          ),
        ));
  }
}
