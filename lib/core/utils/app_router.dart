import 'package:go_router/go_router.dart';
import 'package:meal_recommendation/features/home/presentation/view/home_view.dart';

import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/register_view.dart';
import '../../features/auth/presentation/view/verification_view.dart';
import '../../features/profile/presentation/view/profile_view.dart';
import '../../features/splash/splash_view.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kLoginView = '/loginView';
  static const kRegisterView = '/registerView';
  static const kVerificationView = '/verificationView';
  static const kProfileView = '/profileView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const SplashView();
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
        builder: (context, state) {
          return const RegisterView();
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
      
    
  
