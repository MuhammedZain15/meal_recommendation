import '../../register/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.username,
    required super.email,
    required super.phone,
    required super.password,
  });

  factory UserModel.fromFirebase(Map<String, dynamic> json) {
    return UserModel(
      uid: json['useruid'],
      username: json['username'],
      email: json['useremail'],
      phone: json['userphone'],
      password: json['userpassword'],
    );
  }

  Map<String, dynamic> toJson([String? userId]) {
    return {
      'useruid': userId ?? uid,
      'username': username,
      'useremail': email,
      'userphone': phone,
      'userpassword': password,
    };
  }
}
