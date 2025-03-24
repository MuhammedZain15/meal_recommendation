import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal_recommendation/features/auth/login/domain/repository/login_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginRepository) : super(LoginInitial());
  final LoginRepository loginRepository;
  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await loginRepository.signInWithEmailAndPassword(
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
    var result = await loginRepository.signInWithGoogle();
    result.fold(
          (failure) => emit(LoginError(failure.message)),
          (user) => emit(LoginLoaded()),
    );
  }
}