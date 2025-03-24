import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import 'package:meal_recommendation/features/favorite/data/data_sources/favorites_remote_data_source.dart';
import 'package:meal_recommendation/features/favorite/data/repositories/favorites_repository_impl.dart';
import 'package:meal_recommendation/features/favorite/domain/repositories/favorites_repository.dart';

import 'package:meal_recommendation/features/auth/login/data/data_source/login_datasource.dart';
import 'package:meal_recommendation/features/auth/login/data/repository/login_repository_impl.dart';
import 'package:meal_recommendation/features/auth/login/domain/repository/login_repository.dart';

import '../../features/auth/register/data/data_source/register_datasource.dart';
import '../../features/auth/register/data/repository/register_repository_impl.dart';
import '../../features/auth/register/domain/repository/register_repository.dart';
import '../../features/auth/register/domain/usecase/signup_with_email_usecase.dart';
import '../../features/auth/register/domain/usecase/signup_with_facebook_usecase.dart';
import '../../features/auth/register/domain/usecase/signup_with_google_usecase.dart';
import '../../features/favorite/domain/use_cases/get_favorite_meals_use_case.dart'
    show GetFavoriteMeals;

final GetIt sl = GetIt.instance;

void serviceLocator() {
  // Firebase Instances
  sl.registerLazySingleton<FirebaseAuth>(
    () => FirebaseAuth.instance,
  ); // ✅ حل مشكلة عدم تسجيل FirebaseAuth
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Register Feature
  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(
      auth: sl<FirebaseAuth>(), // ✅ استخدام sl<FirebaseAuth>()
      firestore: sl<FirebaseFirestore>(),
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

  // Favorite Feature
  sl.registerLazySingleton<FavoritesRemoteDataSource>(
    () => FavoritesRemoteDataSourceImpl(sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton<FavoritesRepository>(
    () => FavoritesRepositoryImpl(sl<FavoritesRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetFavoriteMeals>(
    () => GetFavoriteMeals(sl<FavoritesRepository>()),
  );

  sl.registerLazySingleton<LoginDataSourceImpl>(() => LoginDataSourceImpl());
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(remoteDataSource: sl<LoginDataSourceImpl>()),
  );
}
