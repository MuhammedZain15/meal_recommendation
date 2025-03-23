import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:meal_recommendation/features/auth/login/data/data_source/login_datasource.dart';
import 'package:meal_recommendation/features/auth/login/data/repository/login_repository_impl.dart';
import 'package:meal_recommendation/features/auth/login/domain/repository/login_repository.dart';

import '../../features/auth/register/data/data_source/register_datasource.dart';
import '../../features/auth/register/data/repository/register_repository_impl.dart';
import '../../features/auth/register/domain/repository/register_repository.dart';
import '../../features/auth/register/domain/usecase/signup_with_email_usecase.dart';
import '../../features/auth/register/domain/usecase/signup_with_facebook_usecase.dart';
import '../../features/auth/register/domain/usecase/signup_with_google_usecase.dart';

final GetIt sl = GetIt.instance;

void serviceLocator() {
  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(
      auth: FirebaseAuth.instance,
      firestore: FirebaseFirestore.instance,
    ),
  );

  sl.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(
      remoteDataSource: sl<RegisterRemoteDataSource>(),
    ),
  );

  sl.registerLazySingleton<SignUpWithEmailUseCase>(
    () => SignUpWithEmailUseCase(sl<RegisterRepository>()),
  );

  sl.registerLazySingleton<SignInWithGoogleUseCase>(
    () => SignInWithGoogleUseCase(sl<RegisterRepository>()),
  );

  sl.registerLazySingleton<SignInWithFacebookUseCase>(
    () => SignInWithFacebookUseCase(sl<RegisterRepository>()),
  );

  sl.registerLazySingleton<LoginDataSourceImpl>(() => LoginDataSourceImpl());
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(remoteDataSource: sl<LoginDataSourceImpl>()),
  );
}
