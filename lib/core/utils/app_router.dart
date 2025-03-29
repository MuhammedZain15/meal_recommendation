// lib/core/utils/app_router.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/features/gemini/data/%20repositories/gemini.dart';
import 'package:meal_recommendation/features/gemini/data/datasources/gemini_api_service.dart';
import 'package:meal_recommendation/features/gemini/data/datasources/recipe_api_service.dart';
import 'package:meal_recommendation/features/gemini/presentation/bloc/recipe_bloc.dart';
import 'package:meal_recommendation/features/gemini/presentation/pages/recipe_page.dart';

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
import '../../features/gemini/domain/usecases/fetch_recipe.dart';
import '../../features/home/data/models/recipe_model.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/home/presentation/view/recipe_details_view.dart';
import '../../features/home/presentation/view/see_all_view.dart';
import '../../features/onboarding/onboarding_view.dart';
import '../../features/profile/domain/usecase/get_profile_use_case.dart';
import '../../features/profile/domain/usecase/update_profile_use_case.dart';
import '../../features/profile/presentation/controller/bloc/profile_bloc.dart';
import '../../features/profile/presentation/view/profile_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/layout_view.dart';
import '../services/service_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLayoutView = '/layoutView';
  static const kSplashView = '/';
  static const kOnboardingView = '/onboardingView';
  static const kSeeAllView = '/seeAllView';
  static const kDetailsView = '/detailsView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kProfileView = '/profileView';
  static const kFavoriteView = '/favoriteView';
  static const kRecipeDetailsView = '/recipeDetailsView';
  static const kGemini = '/gemini';

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
        path: kLayoutView,
        name: kLayoutView,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) => ProfileBloc(
                  getUser: sl<GetProfileUseCase>(),
                  updateUser: sl<UpdateProfileUseCase>(),
                ),
            child: const LayoutView(),
          );
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
          final recipe = state.extra as RecipeModel;
          return RecipeDetailsView(recipe: recipe);
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
      GoRoute(
        path: kGemini,
        builder: (context, state) {
          return BlocProvider(
            create:
                (context) => RecipeBloc(
                  fetchRecipeUseCase: FetchRecipeUseCase(
                    repository: GeminiRepositoryImpl(
                      geminiApi: GeminiApiService(),
                      recipeApi: SpoonacularApiService(),
                      firestore: FirebaseFirestore.instance,
                    ),
                  ),
                ),
            child: const RecipePage(),
          );
        },
      ),
    ],
  );
}
