import 'package:cmp_app/utils/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      return 'Sesión iniciada';
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<User?> register(
      {required String name,
      required String lastName,
      required String email,
      required String password,
      required String passwordConfirmed}) async {
    try {
      User? user;

      if (password != passwordConfirmed) {
        return null;
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
      return user;
    } on FirebaseAuthException catch (e) {
      return null;
    }
  }
}
