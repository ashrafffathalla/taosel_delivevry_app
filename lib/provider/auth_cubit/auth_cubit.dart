// import 'package:taosel_user_app/data/model/country_model.dart';
import 'package:taoel_driver_app/provider/auth_cubit/auth_state.dart';
import 'package:taoel_driver_app/repositories/auth_repositories/login_repositories.dart';
import 'package:taoel_driver_app/repositories/auth_repositories/sign_up_repositories.dart';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../data/local/hiva_helper.dart';
import '../../repositories/auth_repositories/forget_pass_repositories.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      {required this.loginRepositories,
        required this.signUpRepositories,
        required this.forgetPassRepositories})
      : super(AuthInitial());
  final LoginRepositories loginRepositories;
  final SignUpRepositories signUpRepositories;
  final ForgetPassRepositories forgetPassRepositories;


//user login
  login({required String phone, required String password,required String device_token,}) async {
    emit(AuthLoading());
    try {
      await loginRepositories.login(phone: phone, password: password,device_token: device_token);
      print(device_token.toString()+"GGG");
      emit(AuthLoaded());
    } catch (e) {

      emit(AuthError(error: e.toString()));
    }
  }

  //user Register
  signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String password_confirmation,
  }) async {
    emit(AuthLoading());
    try {
      await signUpRepositories.signUp(
        email: email,
        name: name,
        phone: phone,
        password: password,
        password_confirmation: password_confirmation,);
      emit(AuthLoaded());
    } catch (e) {
      emit(RegisterStateError(error: e.toString()));
    }
  }

  //otp
  checkOtp(String otp) async {
    emit(AuthLoading());
    try {
      await signUpRepositories.otp(otp: otp);
      emit(AuthLoaded());
    } catch (e) {
      emit(AuthError(error: e.toString()));
    }
  }
  ///Check Again OTP
  againCheckOtp(String otp) async {
    emit(AuthLoading());
    try {
      // print("test200");
      // print(HiveHelper().getData('token').toString()+'AShrafOTP');
      await signUpRepositories.Againotp(otp: otp);
      emit(AuthLoaded());
      HiveHelper().removeData("sendAgainToken");
    } catch (e) {
      // print("Ashraf fathalla");
      // print("++++ $e");
      emit(AuthError(error: e.toString()));
    }
  }
  //
  checkOtpPass(String otp) async {
    emit(AuthLoading());
    try {
      // print("test200");
      // print(HiveHelper().getData('token').toString()+'AShrafOTP');
      await signUpRepositories.otpPass(otp: otp);
      emit(AuthLoaded());
      // HiveHelper().removeData('token');
    } catch (e) {
      // print("Ashraf fathalla");
      // print("++++ $e");
      emit(AuthError(error: e.toString()));
    }
  }
  //Change Phone
  changePhone(String phone) async {
    emit(ChangePhoneLoading());
    try {
      // print(phone.toString()+"mrashraf");
      await signUpRepositories.changePhone(phone: phone);
      emit(ChangePhoneLoaded());
    } catch (e) {
      print("phone $e");
      emit(AuthError(error: e.toString()));
    }
  }

  // user forget Password
  forget({required String phone}) async {
    emit(AuthLoading());
    try {
      await forgetPassRepositories.forgetPass(phone: "+2$phone");
      emit(AuthLoaded());
    } catch (e) {
      print("forget $e");
      emit(AuthError(error: e.toString()));
    }
  }
  sendAgain({required String phone}) async {
    emit(AuthLoading());
    try {
      await forgetPassRepositories.sendCodeAgain(phone: phone);
      emit(AuthSendCodeLoaded());
    } catch (e) {
      print("forget $e");
      emit(AuthError(error: e.toString()));
    }
  }
  //change Password
  changepass({
    required String pass,
    required String password_confirmation,
  }) async {
    emit(AuthLoading());
    try {
      await forgetPassRepositories.changePass(
          pass: pass,
          password_confirmation:password_confirmation
      );

      emit(AuthLoaded());
    } catch (e) {
      print("changepass $e");
      emit(AuthError(error: e.toString()));
    }
  }
}