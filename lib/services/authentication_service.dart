import 'package:cmp_app/models/user_model.dart';
import 'package:cmp_app/services/user_service.dart';
import 'package:cmp_app/utils/common.dart';
import 'package:cmp_app/utils/types.dart';
import 'package:cmp_app/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  User? getLoggedUser() {
    return _firebaseAuth.currentUser;
  }

  Future<String> signIn(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return 'Sesión iniciada';
    } on FirebaseAuthException catch (e) {
      Common.showAlert(context, e.message!, false);
      return e.message!;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> register(
      {required String name,
      required String lastName,
      required String email,
      required String password,
      required String passwordConfirmed,
      required BuildContext context}) async {
    try {
      User? user;

      if (password != passwordConfirmed) {
        return 'Contraseñas son diferentes';
      }

      Validators.validateName(name: name);
      Validators.validateName(name: lastName);
      Validators.validateEmail(email: email);

      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;
      await user!.updateDisplayName(name + lastName);
      await user.reload();

      user = _firebaseAuth.currentUser;

      late Users myUser;
      if (user != null) {
        myUser = Users(
            uid: user.uid,
            name: name,
            lastName: lastName,
            email: email,
            phone: '--',
            role: Roles.user);
      }

      UserService().addUser(myUser);

      Common.showAlert(context, 'Registro exitoso', true);
      Navigator.pop(context);
      return 'Registro exitoso';
    } on FirebaseAuthException catch (e) {
      Common.showAlert(context, e.message!, false);
      return e.message!;
    }
  }
}
