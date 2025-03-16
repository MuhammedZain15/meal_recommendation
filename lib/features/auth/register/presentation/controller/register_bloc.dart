import 'package:bloc/bloc.dart';

import '../../domain/usecase/signup_with_facebook_usecase.dart';
import '../../domain/usecase/signup_with_google_usecase.dart';
import '../../domain/usecase/signup_with_email_usecase.dart';
import 'register_event.dart';
import 'register_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpWithEmailUseCase signUpWithEmail;
  final SignInWithGoogleUseCase signInWithGoogle;
  final SignInWithFacebookUseCase signInWithFacebook;

  AuthBloc({
    required this.signUpWithEmail,
    required this.signInWithGoogle,
    required this.signInWithFacebook,
  }) : super(AuthInitial()) {
    on<SignUpWithEmailEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signUpWithEmail.execute(
          email: event.email,
          password: event.password,
          username: event.username,
          phone: event.phone,
        );
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signInWithGoogle.execute();
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignInWithFacebookEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signInWithFacebook.execute();
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
