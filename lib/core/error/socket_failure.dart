import 'package:meal_recommendation/core/error/failure.dart';

class SocketFailure extends Failure {
  const SocketFailure(super.message);

  factory SocketFailure.fromCode(String code) {
    switch (code) {
      case 'network-request-failed':
        return const SocketFailure(
          'A network error occurred. Please check your connection.',
        );
      default:
        return const SocketFailure('An unknown error occurred.');
    }
  }
}
