import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/core/services/service_locator.dart';
import 'package:meal_recommendation/features/auth/register/domain/usecase/signup_with_email_usecase.dart';
import 'package:meal_recommendation/features/auth/register/domain/usecase/signup_with_google_usecase.dart';
import 'package:meal_recommendation/features/home/presentation/view/home_view.dart';
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

  static final GoRouter router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(
        path: kSplashView,
        builder: (context, state) {
          return SplashView();
        },
      ),
      GoRoute(
        path: kOnboardingView,
        builder: (context, state) {
          return OnboardingView();
        },
      ),

      GoRoute(
        path: kHomeView,
        builder: (context, state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) {
          return const LoginView();
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
            child: RegisterView(),
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
        path: kProfileView,
        builder: (context, state) {
          return const ProfileView();
        },
      ),
    ],
  );
}
