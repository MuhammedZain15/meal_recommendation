import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/login/data/data_source/login_datasource.dart';
import '../../features/auth/login/data/repository/login_repository_impl.dart';
import '../../features/auth/login/domain/repository/login_repository.dart';
import '../../features/auth/login/domain/usecase/login_with_email_and_password_usecase.dart';
import '../../features/auth/login/domain/usecase/login_with_google_usecase.dart';
import '../../features/auth/register/data/data_source/register_datasource.dart';
import '../../features/auth/register/data/repository/register_repository_impl.dart';
import '../../features/auth/register/domain/repository/register_repository.dart';
import '../../features/auth/register/domain/usecase/signup_with_email_usecase.dart';
import '../../features/auth/register/domain/usecase/signup_with_facebook_usecase.dart';
import '../../features/auth/register/domain/usecase/signup_with_google_usecase.dart';
import '../../features/favorite/data/data_sources/favorites_remote_data_source.dart';
import '../../features/favorite/data/repositories/favorites_repository_impl.dart';
import '../../features/favorite/domain/repositories/favorites_repository.dart';
import '../../features/favorite/domain/use_cases/get_favorite_meals_use_case.dart'
    show GetFavoriteMeals;
import '../../features/home/data/datasources/recipe_datasource.dart';
import '../../features/home/data/repo/recipe_repository_impl.dart';
import '../../features/home/domain/repos/recipe_repository.dart';
import '../../features/home/presentation/logic/recipe_cubit.dart';
import '../../features/profile/data/data_source/profile_remote_data_source.dart';
import '../../features/profile/data/repository/profile_repository_impl.dart';
import '../../features/profile/domain/repository/profile_repository.dart';
import '../../features/profile/domain/usecase/get_profile_use_case.dart';
import '../../features/profile/domain/usecase/update_profile_use_case.dart';
import 'firebase_utils.dart';

final GetIt sl = GetIt.instance;

void serviceLocator() {
  // Firebase Instances
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Firebase Service
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService());

  // Recipe Feature
  sl.registerLazySingleton<RecipeDataSource>(
    () => RecipeDataSourceImpl(
      firestore: sl<FirebaseFirestore>(),
      auth: sl<FirebaseAuth>(),
    ),
  );

  sl.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(dataSource: sl<RecipeDataSource>()),
  );

  sl.registerFactory(() => RecipeCubit(repository: sl<RecipeRepository>()));

  // Register Feature
  sl.registerLazySingleton<RegisterRemoteDataSource>(
    () => RegisterRemoteDataSourceImpl(firebaseService: sl<FirebaseService>()),
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

  // Login Feature
  sl.registerLazySingleton<LoginDataSourceImpl>(
    () => LoginDataSourceImpl(sl<FirebaseService>()),
  );

  sl.registerLazySingleton<LoginDataSource>(() => sl<LoginDataSourceImpl>());

  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(remoteDataSource: sl<LoginDataSourceImpl>()),
  );

  sl.registerLazySingleton<LoginWithEmailAndPasswordUseCase>(
    () => LoginWithEmailAndPasswordUseCase(sl<LoginRepository>()),
  );

  sl.registerLazySingleton<LoginWithGoogleUseCase>(
    () => LoginWithGoogleUseCase(sl<LoginRepository>()),
  );

  // Profile Feature
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(sl<FirebaseFirestore>()),
  );

  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(sl<ProfileRemoteDataSource>()),
  );

  sl.registerLazySingleton<GetProfileUseCase>(
    () => GetProfileUseCase(sl<ProfileRepository>()),
  );

  sl.registerLazySingleton<UpdateProfileUseCase>(
    () => UpdateProfileUseCase(sl<ProfileRepository>()),
  );
}
