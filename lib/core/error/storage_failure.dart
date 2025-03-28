import 'package:meal_recommendation/core/error/failure.dart';

class StorageFailure extends Failure {
  const StorageFailure(super.message);

  factory StorageFailure.fromMessage(String code) {
    switch (code) {
      case 'write_failed':
        return const StorageFailure('Failed to write data to local storage.');
      case 'read_failed':
        return const StorageFailure('Failed to read data from local storage.');
      case 'delete_failed':
        return const StorageFailure(
          'Failed to delete data from local storage.',
        );
      case 'clear_failed':
        return const StorageFailure('Failed to clear local storage.');
      case 'permission_denied':
        return const StorageFailure('Storage permission denied.');
      case 'storage_full':
        return const StorageFailure(
          'Local storage is full. Cannot save more data.',
        );
      case 'initialization_failed':
        return const StorageFailure('Failed to initialize local storage.');
      case 'data_type_mismatch':
        return const StorageFailure(
          'Attempted to retrieve data with incorrect type.',
        );
      case 'key_not_found':
        return const StorageFailure('Requested key does not exist in storage.');
      default:
        return const StorageFailure('An unknown storage error occurred.');
    }
  }
}
