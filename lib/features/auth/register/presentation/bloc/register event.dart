import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

// 🔹 Event for Email & Password Sign-Up
class SignUpWithEmailEvent extends AuthEvent {
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

class SignInWithGoogleEvent extends AuthEvent {}

class SignInWithFacebookEvent extends AuthEvent {}

class SignOutEvent extends AuthEvent {}
