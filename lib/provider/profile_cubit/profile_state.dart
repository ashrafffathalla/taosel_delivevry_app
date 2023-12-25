part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final ProfileListData profileListData;
  const ProfileLoaded({required this.profileListData});
  @override
  List<Object> get props => [profileListData];
}

class ProfileError extends ProfileState {
  final String error;
  const ProfileError({required this.error});
  @override
  List<Object> get props => [error];
}
class UpdateProfileError extends ProfileState {
  final String error;
  const UpdateProfileError({required this.error});
  @override
  List<Object> get props => [error];
}
class UpdateProfileLoading extends ProfileState {}

class UpdateProfileLoaded extends ProfileState {}
class UpdatePasswordProfileLoaded extends ProfileState {}
///Delete states
class DeleteProfileLoading extends ProfileState {}

// class DeleteProfileSuccess extends ProfileState {
//   final DeleteProfileModel deleteProfileModel;
//
//   DeleteProfileSuccess(this.deleteProfileModel);
//
// // @override
// // List<Object> get props => [deleteProfileModel];
// }

class DeleteProfileFailed extends ProfileState {
  final String? error;

  DeleteProfileFailed(this.error);

// @override
// List<Object> get props => [error ?? ""];
}
class UpdateAllProfileLoading extends ProfileState {}

class UpdateAllProfileLoaded extends ProfileState {}

class UpdateStateOne extends ProfileState {}
class UpdateState extends ProfileState {}