

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/repository/login_repository.dart';
import '../data_source/login_datasource.dart';
import '../data_source/secure_storage_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {


  final LoginDataSource loginDataSource;
  final SecureStorageDataSource storageDataSource;

  LoginRepositoryImpl({required this.loginDataSource, required this.storageDataSource});

  @override
  Future<User?> loginWithEmailAndPassword({required String email,required String password}) async {
    final user = await loginDataSource.loginWithEmailAndPassword(email: email, password: password);
    if (user != null) await storageDataSource.saveToken(await user.getIdToken() ?? "");
    return user;
  }

  @override
  Future<User?> loginWithGoogle() async {
    final user = await loginDataSource.loginWithGoogle();
    if (user != null) await storageDataSource.saveToken(await user.getIdToken() ?? "");
    return user;
  }

  @override
  Future<User?> loginWithFacebook() async {
    final user = await loginDataSource.loginWithFacebook();
    if (user != null) await storageDataSource.saveToken(await user.getIdToken() ?? "");
    return user;
  }

  @override
  Future<void> saveUserToFirestore(User user) async {
    await loginDataSource.saveUserToFirestore(user);
  }

  @override
  Future<void> saveToken(String token) async {
    await storageDataSource.saveToken(token);
  }

  @override
  Future<String?> getToken() async {
    return await storageDataSource.getToken();
  }

  @override
  Future<void> logout() async {
    await storageDataSource.deleteToken();
    await FirebaseAuth.instance.signOut();
  }
}

