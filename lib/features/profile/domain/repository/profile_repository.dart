import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/shared/model/user_model.dart';

abstract class ProflieRepository {
  Future<Either<Failure, UserModel>> getUser();
  Future<Either<Failure, void>> updateUser(UserModel user);
}
