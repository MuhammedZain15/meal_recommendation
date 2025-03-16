import 'package:bloc/bloc.dart';

import '../../domain/usecase/signup_with_facebook_usecase.dart';
import '../../domain/usecase/signup_with_google_usecase.dart';
import '../../domain/usecase/signup_with_email_usecase.dart';
import 'register_event.dart';
import 'register_states.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SignUpWithEmailUseCase signUpWithEmail;
  final SignInWithGoogleUseCase signInWithGoogle;
  final SignInWithFacebookUseCase signInWithFacebook;

  RegisterBloc({
    required this.signUpWithEmail,
    required this.signInWithGoogle,
    required this.signInWithFacebook,
  }) : super(RegisterInitial()) {
    on<SignUpWithEmailEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final user = await signUpWithEmail.execute(
          email: event.email,
          password: event.password,
          username: event.username,
          phone: event.phone,
        );
        emit(RegisterSuccess(user));
      } catch (e) {
        emit(RegisterFailure(e.toString()));
      }
    });

    on<SignInWithGoogleEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final user = await signInWithGoogle.execute();
        emit(RegisterSuccess(user));
      } catch (e) {
        emit(RegisterFailure(e.toString()));
      }
    });

    on<SignInWithFacebookEvent>((event, emit) async {
      emit(RegisterLoading());
      try {
        final user = await signInWithFacebook.execute();
        emit(RegisterSuccess(user));
      } catch (e) {
        emit(RegisterFailure(e.toString()));
      }
    });
  }
}
