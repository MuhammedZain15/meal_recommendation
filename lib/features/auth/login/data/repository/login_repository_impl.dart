import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/core/error/firebase_failure.dart';
import 'package:meal_recommendation/core/error/socket_failure.dart';
import 'package:meal_recommendation/core/error/storage_failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/error/google_sign_in_failure.dart';
import '../data_source/login_datasource.dart';
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
      await saveUserIdLocally(user.uid);

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } on StorageFailure catch (e) {
      return left(StorageFailure.fromMessage(e.message));
    } on SocketFailure catch (e) {
      return left(SocketFailure(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signInWithGoogle() async {
    try {
      final user = await remoteDataSource.loginWithGoogle();
      await saveUserIdLocally(user.uid);

      return Right(user);
    } on FirebaseAuthException catch (e) {
      return left(FirebaseFailure.fromCode(e.code));
    } on StorageFailure catch (e) {
      return left(StorageFailure.fromMessage(e.message));
    } on SocketFailure catch (e) {
      return left(SocketFailure(e.message));
    } on GoogleSignInFailure catch (e) {
      return left(FirebaseFailure.fromCode(e.message));
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  Future<void> saveUserIdLocally(String? userId) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('userId', userId ?? '');
  }
}
