import 'package:bloc/bloc.dart';

import '../../domain/usecase/sign up with facebook usecase.dart';
import '../../domain/usecase/sign up with google usecase.dart';
import '../../domain/usecase/signup with email usecase.dart';
import 'register_event.dart';
import 'register_states.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpWithEmail signUpWithEmail;
  final SignInWithGoogle signInWithGoogle;
  final SignInWithFacebook signInWithFacebook;

  AuthBloc({
    required this.signUpWithEmail,
    required this.signInWithGoogle,
    required this.signInWithFacebook,
  }) : super(AuthInitial()) {
    on<SignUpWithEmailEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signUpWithEmail(
            event.email, event.password, event.username, event.phone);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signInWithGoogle();
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignInWithFacebookEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signInWithFacebook();
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}
