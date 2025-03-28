import 'package:meal_recommendation/core/error/failure.dart';

import '../../../../../core/services/firebase_auth_service.dart';
import '../../../shared/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class RegisterRemoteDataSource {
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String phone,
  });

  Future<UserModel> signInWithGoogle();
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  final FirebaseAuthService firebaseService;

  RegisterRemoteDataSourceImpl({required this.firebaseService});

  @override
  Future<UserModel> signUpWithEmail({
    required String email,
    required String password,
    required String username,
    required String phone,
  }) async {
    User? user = await firebaseService.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (user == null) throw const Failure("User creation failed");

    await user.updateDisplayName(username);

    final userModel = UserModel(
      uid: user.uid,
      username: username,
      email: email,
      phone: phone,
      password: password,
    );
    await firebaseService.saveUserData(user.uid, userModel.toJson());

    return userModel;
  }

  @override
  Future<UserModel> signInWithGoogle() async {
    final user = await firebaseService.signInWithGoogle();
    if (user == null) throw const Failure("Google Sign-In failed");

    return UserModel(
      uid: user.uid,
      username: user.displayName ?? "",
      email: user.email!,
      phone: user.phoneNumber ?? "",
      password: "",
    );
  }
}
