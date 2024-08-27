import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;

  UserRepository() : _firebaseAuth = FirebaseAuth.instance;

  Future<void> signInWithCredentials(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception('No user found for that email.');
        case 'wrong-password':
          throw Exception('Wrong password provided.');
        default:
          throw Exception('An error occurred. Please try again.');
      }
    } catch (e) {
      throw Exception('An unknown error occurred.');
    }
  }
  
  Future<UserCredential> signUp(String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw Exception('The password provided is too weak.');
        case 'email-already-in-use':
          throw Exception('The account already exists for that email.');
        default:
          throw Exception('An error occurred. Please try again.');
      }
    } catch (e) {
      throw Exception('An unknown error occurred.');
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception('An error occurred while signing out. Please try again.');
    }
  }

  Future<bool> isSignedIn() async {
    try {
      final currentUser = _firebaseAuth.currentUser;
      return currentUser != null;
    } catch (e) {
      throw Exception('An error occurred while checking sign-in status.');
    }
  }

  User? getUser() {
    try {
      return _firebaseAuth.currentUser;
    } catch (e) {
      throw Exception('An error occurred while getting the current user.');
    }
  }
}