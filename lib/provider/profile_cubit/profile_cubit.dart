import 'dart:math';
import 'package:taoel_driver_app/data/model/profile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import '../../data/model/deleteProfileModel.dart';
import '../../repositories/profile_repositories/delete_account.dart';
import '../../repositories/profile_repositories/get_profile_repository.dart';
import '../../repositories/profile_repositories/update_all_fields.dart';
import '../../repositories/profile_repositories/update_email.dart';
import '../../repositories/profile_repositories/update_name.dart';
import '../../repositories/profile_repositories/update_password.dart';
import '../../repositories/profile_repositories/update_phone.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  GetProfileRepository getProfileRepository;
  // DeleteAccountRepositories deleteAccountRepositories;
  UpdateName updateName;
  UpdateEmail updateEmail;
  UpdatePhone updatePhone;
  UpdatePassword updatePassword;
  UpdateAllFields updateAllFields;
  ProfileCubit(
      {
        required this.getProfileRepository,
        // required this.deleteAccountRepositories,
      required this.updateName,
      required this.updateEmail,
      required this.updatePhone,
      required this.updatePassword,
        required this.updateAllFields
      })
      : super(ProfileInitial());
  ProfileListData ? profileListProfileData;
  getProfileData() async {
    emit(ProfileLoading());
    try {
      profileListProfileData = await getProfileRepository.getProfileData();
      emit(ProfileLoaded(profileListData: profileListProfileData!));
    } catch (e) {
      emit(ProfileError(error: e.toString()));
    }
  }
  ///DELETE PROFILE

  // dynamic code;
  //
  // Future<void> deleteProfile() async {
  //   emit(DeleteProfileLoading());
  //   try {
  //     final DeleteProfileModel? deleteProfileModel =
  //     await deleteAccountRepositories.deleteProfile();
  //     code = deleteProfileModel!.data!.code.toString();
  //     emit(DeleteProfileSuccess(deleteProfileModel));
  //   } catch (error) {
  //     emit(DeleteProfileFailed(error.toString()));
  //   }
  // }
  updateProfileName(String name) async {
    emit(UpdateProfileLoading());
    try {
      await updateName.updateName(name: name);
      emit(UpdateProfileLoaded());
    } catch (e) {
      print(e.toString());
      emit(UpdateProfileError(error: e.toString()));
    }
  }

  updateProfileEmail(String email) async {
    emit(UpdateProfileLoading());
    try {
      await updateEmail.updateEmail(email: email);
      emit(UpdateProfileLoaded());
    } catch (e) {
      emit(UpdateProfileError(error: e.toString()));
    }
  }

  updateProfilePhone(String phone) async {
    emit(UpdateProfileLoading());

    try {
      await updatePhone.updatePhone(phone: phone);
      emit(UpdateProfileLoaded());
    } catch (e) {
      emit(UpdateProfileError(error: e.toString()));
    }
  }

  updateProfilePassword(String password,String new_password_confirmation,) async {
    emit(UpdateProfileLoading());
    try {
      await updatePassword.updatePassword(password: password,new_password_confirmation:new_password_confirmation );
      emit(UpdatePasswordProfileLoaded());
    } catch (e) {
      emit(UpdateProfileError(error: e.toString()));
    }
  }
  /*
  ----------------------------------
  ----------update All Fields-------
  ----------------------------------
   */
updateAllFieldsAccInfo({
  required dynamic name,
  required dynamic email,
  required dynamic phone,
  required dynamic image,


})async{
  try {
    await updateAllFields.updateAllFields(
        name: name,
        email: email,
        phone: phone,
      image: image,
    );
    emit(UpdateAllProfileLoaded());

  } catch (e) {
    emit(UpdateProfileError(error: e.toString()));
  }
}
  updateState() async {
    final ProfileListData profileListData =
    await getProfileRepository.getProfileData();
    emit(ProfileLoaded(profileListData: profileListData));
  }
  updateSwitchState()async{
    emit(UpdateStateOne());
    emit(UpdateState());
  }
}
