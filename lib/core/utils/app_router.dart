import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/login/domain/usecase/login_with_email_and_password_usecase.dart';
import '../../features/auth/login/domain/usecase/login_with_google_usecase.dart';
import '../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import '../../features/auth/login/presentation/view/login_view.dart';
import '../../features/auth/register/domain/usecase/signup_with_email_usecase.dart';
import '../../features/auth/register/domain/usecase/signup_with_facebook_usecase.dart';
import '../../features/auth/register/domain/usecase/signup_with_google_usecase.dart';
import '../../features/auth/register/presentation/controller/register_bloc.dart';
import '../../features/auth/register/presentation/view/register_view.dart';
import '../../features/favorite/domain/use_cases/get_favorite_meals_use_case.dart';
import '../../features/favorite/presentation/controller/favorites_bloc.dart';
import '../../features/favorite/presentation/pages/favorite_view.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/home/presentation/view/recipe_details_view.dart';
import '../../features/home/presentation/view/see_all_view.dart';
import '../../features/onboarding/onboarding_view.dart';
import '../../features/profile/data/data_source/profile_remote_data_source.dart';
import '../../features/profile/data/repository/profile_repository_impl.dart';
import '../../features/profile/domain/usecase/get_profile_use_case.dart';
import '../../features/profile/domain/usecase/update_profile_use_case.dart';
import '../../features/profile/presentation/controller/bloc/profile_bloc.dart';
import '../../features/profile/presentation/view/profile_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/styled_bottom_nav_bar.dart';
import '../services/service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kNavBarView = '/navBarView';
  static const kSplashView = '/';
  static const kOnboardingView = '/onboardingView';
  static const kSeeAllView = '/seeAllView';
  static const kDetailsView = '/detailsView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kProfileView = '/profileView';
  static const kFavoriteView = '/favoriteView';
  static const kRecipeDetailsView = '/recipeDetailsView';

  static final GoRouter router = GoRouter(
    initialLocation: kNavBarView,
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kNavBarView,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) => ProfileBloc(
                  getUser: GetProfileUseCase(
                    ProfileRepositoryImpl(
                      ProfileRemoteDataSourceImpl( FirebaseFirestore.instance),
                    ),
                  ),
                  updateUser: UpdateProfileUseCase(
                    ProfileRepositoryImpl(
                      ProfileRemoteDataSourceImpl(  FirebaseFirestore.instance),
                    ),
                  ),
                ),
            child: const StyledBottomNavBar(),
          );
        },
      ),
      GoRoute(
        path: kDetailsView,
        builder: (context, state) {
          return const RecipeDetailsView();
        },
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) {
          return const OnboardingView();
        },
      ),
      GoRoute(
        path: kHomeView,
        name: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kRecipeDetailsView,
        name: kRecipeDetailsView,
        builder: (context, state) {
          return const RecipeDetailsView();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) => LoginCubit(
                  loginWithEmailAndPasswordUseCase:
                      sl<LoginWithEmailAndPasswordUseCase>(),
                  loginWithGoogleUseCase: sl<LoginWithGoogleUseCase>(),
                ),
            child: const LoginView(),
          );
        },
      ),

      GoRoute(
        path: kRegisterView,
        name: kRegisterView,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) => RegisterBloc(
                  signUpWithEmail: sl<SignUpWithEmailUseCase>(),
                  signInWithGoogle: sl<SignInWithGoogleUseCase>(),
                  signInWithFacebook: sl<SignInWithFacebookUseCase>(),
                ),
            child: const RegisterView(),
          );
        },
      ),
      GoRoute(
        path: kFavoriteView,
        name: kFavoriteView,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) =>
                    FavoritesCubit(sl<GetFavoriteMeals>())..fetchFavorites(),
            child: const FavoriteView(),
          );
        },
      ),
      GoRoute(
        path: kProfileView,
        builder: (context, state) {
          return const ProfileView();
        },
      ),
      GoRoute(
        path: kSeeAllView,
        builder: (context, state) {
          return const SeeAllView();
        },
      ),
    ],
  );
}
