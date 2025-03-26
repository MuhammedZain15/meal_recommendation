import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/services/service_locator.dart';
import '../../../domain/usecase/login_with_email_and_password_usecase.dart';
import '../../../domain/usecase/login_with_google_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  LoginCubit({required loginWithEmailAndPasswordUseCase, required loginWithGoogleUseCase})
    : loginWithEmailAndPasswordUseCase = sl<LoginWithEmailAndPasswordUseCase>(),
      loginWithGoogleUseCase = sl<LoginWithGoogleUseCase>(),
      super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await loginWithEmailAndPasswordUseCase.execute(
      email,
      password,
    );
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginLoaded()),
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    var result = await loginWithGoogleUseCase.execute();
    result.fold(
      (failure) => emit(LoginError(failure.message)),
      (user) => emit(LoginLoaded()),
    );
  }
}
