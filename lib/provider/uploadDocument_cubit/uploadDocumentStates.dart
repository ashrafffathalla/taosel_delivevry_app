import 'package:equatable/equatable.dart';

abstract class UploadDocumentState extends Equatable {
  const UploadDocumentState();

  @override
  List<Object> get props => [];
}

// Edit Profile
class UploadDocumentInitial extends UploadDocumentState {}

class  UploadDocumentLoading extends UploadDocumentState {}
class  UploadDocumentSuccess extends UploadDocumentState {}
class UploadDocumentError extends UploadDocumentState {
  final String error;

  const UploadDocumentError(this.error);
  @override
  List<Object> get props => [error];
}

//upload image
class ImageProfileLodingState extends UploadDocumentState {}

class ImageProfileScussesState extends UploadDocumentState {}

class ImageProfileErrorState extends UploadDocumentState {
  final String error;

  const ImageProfileErrorState({
    required this.error,
  });
}
class EditProfileLoading extends UploadDocumentState {}

class EditProfileLoaded extends UploadDocumentState {}

class EditProfileError extends UploadDocumentState {
  final String error;

  const EditProfileError(this.error);
  @override
  List<Object> get props => [error];
}