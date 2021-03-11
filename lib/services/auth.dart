import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User get currentUser;

  Stream<User> authStateChanges();

  Future<User> signInAnonymously();

  Future<User> signInWithGoogle();

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<User> authStateChanges() => _firebaseAuth.authStateChanges();

  @override
  User get currentUser => _firebaseAuth.currentUser;

  @override
  Future<User> signInAnonymously() async {
    final userCredential = await _firebaseAuth.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future<User> signInWithGoogle() async {
    final ggSignIn = GoogleSignIn();
    final ggUser = await ggSignIn.signIn();
    if (ggUser != null) {
      final ggAuth = await ggUser.authentication;
      if (ggAuth.idToken != null) {
        final userCredential = await _firebaseAuth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: ggAuth.idToken, accessToken: ggAuth.accessToken));

        return userCredential.user;
      } else {
        throw FirebaseAuthException(
            message: 'Missing GG ID token',
            code: 'ERROR_MISSING_GOOGLE_ID_TOKEN');
      }
    } else {
      throw FirebaseAuthException(
          message: 'Sign in aborted by user', code: 'ERROR_ABORTED_BY_USER');
    }
  }

  @override
  Future<void> signOut() async {
    final ggSignIn = GoogleSignIn();
    await ggSignIn.signOut();
    await _firebaseAuth.signOut();
  }
}
