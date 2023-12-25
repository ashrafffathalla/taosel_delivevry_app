import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {}
class AuthSendCodeLoaded extends AuthState {}

class RegisterStateError extends AuthState {
  final String error;
  const RegisterStateError({required this.error});
  @override
  List<Object> get props => [error];
}
class AuthError extends AuthState {
  final String error;
  const AuthError({required this.error});
  @override
  List<Object> get props => [error];
}
class CountryLoading extends AuthState {}

class CountryLoaded extends AuthState {}

class ChangePhoneLoading extends AuthState {}

class ChangePhoneLoaded extends AuthState {}

class ImageProfileLodingState extends AuthState {}

class ImageProfileScussesState extends AuthState {}

class ImageProfileErrorState extends AuthState {
  final String error;
  const ImageProfileErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
