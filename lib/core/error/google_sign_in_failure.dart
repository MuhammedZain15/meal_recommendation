import 'package:meal_recommendation/core/error/failure.dart';

class GoogleSignInFailure extends Failure {
  const GoogleSignInFailure(super.message);

  factory GoogleSignInFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const GoogleSignInFailure(
          'This email is already linked to another sign-in method.',
        );
      case 'invalid-credential':
        return const GoogleSignInFailure('The credential received is invalid.');
      case 'operation-not-allowed':
        return const GoogleSignInFailure(
          'Google sign-in is not enabled for this project.',
        );
      case 'user-disabled':
        return const GoogleSignInFailure(
          'This user account has been disabled.',
        );
      case 'user-not-found':
        return const GoogleSignInFailure('No user found with this email.');
      case 'wrong-password':
        return const GoogleSignInFailure('Incorrect password.');
      case 'invalid-verification-code':
        return const GoogleSignInFailure('Invalid verification code entered.');
      case 'invalid-verification-id':
        return const GoogleSignInFailure('Invalid verification ID.');
      case 'sign_in_canceled':
        return const GoogleSignInFailure(
          'Google sign-in was canceled by the user.',
        );
      case 'network_error':
        return const GoogleSignInFailure(
          'Network error occurred. Check your internet connection.',
        );
      case 'sign_in_failed':
        return const GoogleSignInFailure('Google sign-in failed. Try again.');
      default:
        return const GoogleSignInFailure('An unknown error occurred.');
    }
  }
}
