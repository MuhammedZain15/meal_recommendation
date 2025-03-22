import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meal_recommendation/features/auth/login/domain/usecase/login_with_email_usecase.dart';
import 'package:meal_recommendation/features/auth/login/domain/usecase/login_with_facebook_usecase.dart';
import 'package:meal_recommendation/features/auth/login/domain/usecase/login_with_google_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginWithEmailUsecase loginWithEmailUsecase;
  final LoginWithGoogleUsecase loginWithGoogleUseCase;
  final LoginWithFacebookUsecase loginWithFacebookUseCase;

  LoginBloc({
    required this.loginWithEmailUsecase,
    required this.loginWithGoogleUseCase,
    required this.loginWithFacebookUseCase,
  }) : super(LoginInitial()) {
    on<LoginWithEmailEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await loginWithEmailUsecase(event.email, event.password);
        if (user != null) {
          emit(LoginSuccess(user));
        } else {
          emit(LoginError('Login failed'));
        }
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });

    on<LoginWithGoogleEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await loginWithGoogleUseCase.call();
        if (user != null) {
          emit(LoginSuccess(user));
        } else {
          emit(LoginError('Login failed'));
        }
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });

    on<LoginWithFacebookEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final user = await loginWithFacebookUseCase.call();
        if (user != null) {
          emit(LoginSuccess(user));
        } else {
          emit(LoginError('Login failed'));
        }
      } catch (e) {
        emit(LoginError(e.toString()));
      }
    });
  }
}
