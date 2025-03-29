import 'package:meal_recommendation/core/error/failure.dart';

class FirebaseFailure extends Failure {
  const FirebaseFailure(super.message);

  factory FirebaseFailure.fromCode(String code) {
    switch (code) {
      case 'aborted':
        return const FirebaseFailure(
          'The operation was aborted due to concurrency issues.',
        );
      case 'already-exists':
        return const FirebaseFailure(
          'The document you are trying to create already exists.',
        );
      case 'cancelled':
        return const FirebaseFailure('The operation was cancelled.');
      case 'data-loss':
        return const FirebaseFailure(
          'Unrecoverable data loss or corruption occurred.',
        );
      case 'deadline-exceeded':
        return const FirebaseFailure(
          'The operation took too long to complete.',
        );
      case 'failed-precondition':
        return const FirebaseFailure(
          'The system is not in the required state to execute the operation.',
        );
      case 'internal':
        return const FirebaseFailure('An internal error occurred.');
      case 'invalid-argument':
        return const FirebaseFailure('Invalid argument provided.');
      case 'not-found':
        return const FirebaseFailure('The requested document was not found.');
      case 'ok':
        return const FirebaseFailure('Operation completed successfully.');
      case 'out-of-range':
        return const FirebaseFailure(
          'The operation was attempted outside the valid range.',
        );
      case 'permission-denied':
        return const FirebaseFailure(
          'You do not have permission to perform this operation.',
        );
      case 'resource-exhausted':
        return const FirebaseFailure(
          'Resource limit exceeded. Try again later.',
        );
      case 'unauthenticated':
        return const FirebaseFailure('Invalid authentication credentials.');
      case 'unavailable':
        return const FirebaseFailure(
          'Service is currently unavailable. Try again later.',
        );
      case 'unimplemented':
        return const FirebaseFailure('This operation is not supported.');
      case 'unknown':
      default:
        return const FirebaseFailure('An unknown error occurred.');
    }
  }
}
