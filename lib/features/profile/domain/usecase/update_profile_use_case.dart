import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/shared/model/user_model.dart';
import '../repository/profile_repository.dart';

class UpdateProfileUseCase {
  final ProflieRepository repository;

  UpdateProfileUseCase(this.repository);

  Future<Either<Failure, void>> call(UserModel user) {
    return repository.updateUser(user);
  }
}
