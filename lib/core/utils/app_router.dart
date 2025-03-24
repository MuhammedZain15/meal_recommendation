import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/services/service_locator.dart';
import 'package:meal_recommendation/features/auth/login/domain/repository/login_repository.dart';
import 'package:meal_recommendation/features/auth/login/presentation/manager/login_cubit/login_cubit.dart';
import 'package:meal_recommendation/features/auth/register/domain/usecase/signup_with_email_usecase.dart';
import 'package:meal_recommendation/features/auth/register/domain/usecase/signup_with_google_usecase.dart';
import 'package:meal_recommendation/features/favorite/domain/use_cases/get_favorite_meals_use_case.dart';
import 'package:meal_recommendation/features/favorite/presentation/controller/favorites_bloc.dart';
import 'package:meal_recommendation/features/favorite/presentation/pages/favorite_view.dart';
import 'package:meal_recommendation/features/home/presentation/view/home_view.dart';
import 'package:meal_recommendation/features/home/presentation/view/recipe_details_view.dart';
import 'package:meal_recommendation/features/onboarding/onboarding_view.dart';
import 'package:meal_recommendation/features/splash/splash_view.dart';

import '../../features/auth/login/presentation/view/login_view.dart';
import '../../features/auth/register/domain/usecase/signup_with_facebook_usecase.dart';
import '../../features/auth/register/presentation/controller/register_bloc.dart';
import '../../features/auth/register/presentation/view/register_view.dart';
import '../../features/auth/verification/presentation/view/verification_view.dart';
import '../../features/profile/presentation/view/profile_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kSplashView = '/';
  static const kOnboardingView = '/onboardingView';
  static const kSeeAllView = '/seeAllView';
  static const kDetailsView = '/detailsView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kVerificationView = '/verificationView';
  static const kProfileView = '/profileView';
  static const kFavoriteView = '/favoriteView';
  static const kRecipeDetailsView = '/recipeDetailsView';

  static final GoRouter router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) {
          return const SplashView();
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
            create: (context) => LoginCubit(sl.get<LoginRepository>()),
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
        path: kVerificationView,
        builder: (context, state) {
          return const VerificationView();
        },
      ),
      GoRoute(
        path: kFavoriteView,
        name: kFavoriteView,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => FavoritesCubit(sl<GetFavoriteMeals>())..fetchFavorites(),
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
    ],
  );
}
