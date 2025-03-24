import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/core/error/custom_exception.dart';

import 'package:meal_recommendation/core/error/failure.dart';
import 'package:meal_recommendation/features/auth/login/data/data_source/login_datasource.dart';
import '../../domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSourceImpl remoteDataSource;

  LoginRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, User>> signInWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      final user = await remoteDataSource.loginWithEmailAndPassword(
        email,
        password,
      );
      return Right(user);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpl.signInWithEmailAndPassword: ${e.toString()}',
      );
    }
    return left(ServerFailure('An error occurred while signing in.'));
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final user = await remoteDataSource.loginWithGoogle();
      return Right(user);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle: ${e.toString()}');
    }
    return left(ServerFailure('An error occurred while signing in.'));
  }
}