import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// 🔹 Event for Email & Password Sign-Up
class SignUpWithEmailEvent extends RegisterEvent {
  final String email;
  final String password;
  final String username;
  final String phone;

  SignUpWithEmailEvent({
    required this.email,
    required this.password,
    required this.username,
    required this.phone,
  });

  @override
  List<Object?> get props => [email, password, username, phone];
}

class SignInWithGoogleEvent extends RegisterEvent {}

class SignInWithFacebookEvent extends RegisterEvent {}

class SignOutEvent extends RegisterEvent {}
