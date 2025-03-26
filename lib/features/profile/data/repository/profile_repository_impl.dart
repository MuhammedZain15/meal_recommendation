import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../auth/shared/model/user_model.dart';
import '../../domain/repository/profile_repository.dart';
import '../data_source/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProflieRepository {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserModel>> getUser() async {
    try {
      final user = await remoteDataSource.getUser();
      return Right(user);
    } catch (e) {
      return Left(ServerFailure('Error getting user'));
    }
  }

  @override
  Future<Either<Failure, void>> updateUser(UserModel user) async {
    try {
      await remoteDataSource.updateUser(user);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Error updating user'));
    }
  }
}
