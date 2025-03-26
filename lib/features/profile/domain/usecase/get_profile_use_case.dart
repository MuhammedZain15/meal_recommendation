import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/shared/model/user_model.dart';
import '../repository/profile_repository.dart';

class GetProfileUseCase {
  final ProflieRepository repository;

  GetProfileUseCase(this.repository);

  Future<Either<Failure, UserModel>> call() {
    return repository.getUser();
  }
}
