import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/shared/model/user_model.dart';

abstract class ProfileRemoteDataSource {
  Future<UserModel> getUser();
  Future<void> updateUser(UserModel user);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestore;

  ProfileRemoteDataSourceImpl(this.firestore);

  @override
  Future<UserModel> getUser() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userId = sharedPreferences.getString('userId');
    if (userId == null) {
      throw Exception('User not found');
    }
    final doc = await firestore.collection('users').doc(userId).get();
    if (doc.exists) {
      return UserModel.fromFirebase(doc.data()!);
    } else {
      throw Exception('User not found');
    }
  }

  @override
  Future<void> updateUser(UserModel user) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final userId = sharedPreferences.getString('userId');
    await firestore.collection('users').doc(user.uid).set(user.toJson(userId));
  }
}
