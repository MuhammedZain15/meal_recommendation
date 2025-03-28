import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../../../../core/services/service_locator.dart';
import '../../../../../home/data/repo/recipe_initializer.dart';
import '../../../domain/usecase/login_with_email_and_password_usecase.dart';
import '../../../domain/usecase/login_with_google_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;

  LoginCubit({
    required loginWithEmailAndPasswordUseCase,
    required loginWithGoogleUseCase,
  }) : loginWithEmailAndPasswordUseCase =
           sl<LoginWithEmailAndPasswordUseCase>(),
       loginWithGoogleUseCase = sl<LoginWithGoogleUseCase>(),
       super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    var result = await loginWithEmailAndPasswordUseCase.execute(
      email,
      password,
    );
    result.fold((failure) => emit(LoginError(failure.message)), (user) async {
      // Initialize recipes for the user
      try {
        await RecipeInitializer.initializeRecipesIfNeeded(
          FirebaseFirestore.instance,
        );
      } catch (e) {
        // Continue with login even if recipe initialization fails
      }
      emit(LoginLoaded());
    });
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    var result = await loginWithGoogleUseCase.execute();
    result.fold((failure) => emit(LoginError(failure.message)), (user) async {
      // Initialize recipes for the user
      try {
        await RecipeInitializer.initializeRecipesIfNeeded(
          FirebaseFirestore.instance,
        );
      } catch (e) {
        // Continue with login even if recipe initialization fails
      }
      emit(LoginLoaded());
    });
  }
}
