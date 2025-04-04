import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/shared/model/user_model.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final user = await remoteDataSource.getUser();
      return Right(user);
    } catch (e) {
      return const Left(Failure('Error getting user'));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserModel user) async {
    try {
      await remoteDataSource.updateUser(user);
      return const Right(null);
    } catch (e) {
      return const Left(Failure('Error updating user'));
    }
  }
}
