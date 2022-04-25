import 'package:cmp_app/screens/logged_screen.dart';
import 'package:cmp_app/screens/sign_in_screen.dart';
import 'package:cmp_app/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const UserScreen();
    }
    return SignInScreen();
  }
}
