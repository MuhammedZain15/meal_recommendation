part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProfileEvent extends ProfileEvent {


  GetProfileEvent();

  @override
  List<Object?> get props => [];
}

class SaveProfileEvent extends ProfileEvent {
  final UserModel user;

  SaveProfileEvent(this.user);

  @override
  List<Object?> get props => [user];
}
