import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../auth/shared/model/user_model.dart';
import '../../../domain/usecase/get_profile_use_case.dart';
import '../../../domain/usecase/update_profile_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUseCase getUser;
  final UpdateProfileUseCase updateUser;

  ProfileBloc({required this.getUser, required this.updateUser})
    : super(ProfileInitial()) {
    on<GetProfileEvent>(_onLoadUser);
    on<SaveProfileEvent>(_onSaveUser);
  }

  void _onLoadUser(GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final result = await getUser();
    result.fold(
      (failure) => emit(const ProfileError('Failed to load user')),
      (user) => emit(ProfileLoaded(user)),
    );
  }

  void _onSaveUser(SaveProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());
    final result = await updateUser(event.user);
    result.fold(
      (failure) => emit(const ProfileError('Failed to update user')),
      (_) => emit(ProfileUpdated()),
    );
  }
}
