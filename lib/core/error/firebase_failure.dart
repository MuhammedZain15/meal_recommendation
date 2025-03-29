import 'package:meal_recommendation/core/error/failure.dart';

class FirebaseFailure extends Failure {
  const FirebaseFailure(super.message);

  factory FirebaseFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const FirebaseFailure('The email address is not valid.');
      case 'user-disabled':
        return const FirebaseFailure(
          'The user corresponding to the given email has been disabled.',
        );
      case 'user-not-found':
        return const FirebaseFailure(
          'No user found corresponding to the given email.',
        );
      case 'wrong-password':
        return const FirebaseFailure(
          'The password is invalid for the given email.',
        );
      case 'too-many-requests':
        return const FirebaseFailure(
          'Too many requests. Please try again later.',
        );
      case 'user-token-expired':
        return const FirebaseFailure(
          'The user is no longer authenticated. Token has expired.',
        );
      case 'network-request-failed':
        return const FirebaseFailure(
          'A network error occurred. Please check your connection.',
        );
      case 'invalid-credential':
      case 'INVALID_LOGIN_CREDENTIALS':
        return const FirebaseFailure('Invalid login credentials provided.');
      case 'operation-not-allowed':
        return const FirebaseFailure(
          'Email/password accounts are not enabled. Please contact support.',
        );
      default:
        return const FirebaseFailure('An unknown error occurred.');
    }
  }
}
