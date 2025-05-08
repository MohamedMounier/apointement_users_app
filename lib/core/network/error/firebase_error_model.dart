import 'package:firebase_auth/firebase_auth.dart';
import 'base_error_model.dart';

class FirebaseErrorModel extends BaseErrorModel {
  const FirebaseErrorModel({required super.message, required super.code});

  static FirebaseErrorModel fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const FirebaseErrorModel(message: 'Email already in use', code: 409);
      case 'invalid-email':
        return const FirebaseErrorModel(message: 'Invalid email address', code: 400);
      case 'user-not-found':
        return const FirebaseErrorModel(message: 'No user found with that email', code: 404);
      case 'wrong-password':
        return const FirebaseErrorModel(message: 'Incorrect password', code: 401);
      case 'weak-password':
        return const FirebaseErrorModel(message: 'Password is too weak', code: 400);
      default:
        return FirebaseErrorModel(message: 'Firebase error: $code', code: 500);
    }
  }

}
