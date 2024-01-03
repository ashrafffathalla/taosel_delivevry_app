import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taoel_driver_app/provider/uploadDocument_cubit/uploadDocumentStates.dart';
import '../../repositories/auth_repositories/sign_up_repositories.dart';
class UploadDocumentCubit extends Cubit<UploadDocumentState> {
  UploadDocumentCubit({
    required this.signUpRepositories,
}) : super(UploadDocumentInitial());
  final SignUpRepositories signUpRepositories;
  static UploadDocumentCubit get(context) => BlocProvider.of(context);


  //upload Image
  var picker = ImagePicker();
  XFile? imageProfile;
  String imagePathFace = "";
  void getImage() async {
    emit(ImageProfileLodingState());

    imageProfile =
    await picker.pickImage(source: ImageSource.gallery).then((value) async {
      imagePathFace = value!.path;
      // print(imagePathFace);

      emit(ImageProfileScussesState());
    }).catchError((e) {
      emit(ImageProfileErrorState(error: e.toString()));
    });
  }

  XFile? licenceImage;
  String licenceImagePathFace = "";
  void getLicenceImage() async {
    emit(ImageProfileLodingState());

    licenceImage =
    await picker.pickImage(source: ImageSource.gallery).then((value) async {
      licenceImagePathFace = value!.path;
      // print(imagePathFace);

      emit(ImageProfileScussesState());
    }).catchError((e) {
      emit(ImageProfileErrorState(error: e.toString()));
    });
  }
///carLicenceImage
  XFile? carLicenceImage;
  String carLicenceImagePathFace = "";
  void getCarLicenceImage() async {
    emit(ImageProfileLodingState());

    carLicenceImage =
    await picker.pickImage(source: ImageSource.gallery).then((value) async {
      carLicenceImagePathFace = value!.path;
      // print(imagePathFace);

      emit(ImageProfileScussesState());
    }).catchError((e) {
      emit(ImageProfileErrorState(error: e.toString()));
    });
  }
  ///carLicenceImage
  XFile? carImage;
  String carImagePathFace = "";
  void getCarImage() async {
    emit(ImageProfileLodingState());

    carImage =
    await picker.pickImage(source: ImageSource.gallery).then((value) async {
      carImagePathFace = value!.path;
      // print(imagePathFace);

      emit(ImageProfileScussesState());
    }).catchError((e) {
      emit(ImageProfileErrorState(error: e.toString()));
    });
  }



  ///uplod Licence Image
  // var pickerLicence = ImagePicker();
  // XFile? imageProfileLicence;
  // String imagePathFaceLicence = "";
  //
  // void getImageLicence() async {
  //   emit(ImageLicenceLoadingState());
  //
  //   imageProfileLicence =
  //   await pickerLicence.pickImage(source: ImageSource.gallery).then((value) async {
  //     imagePathFaceLicence = value!.path;
  //     print(imagePathFaceLicence);
  //     emit(ImageLicenceLSuccessState());
  //   }).catchError((e) {
  //     emit(ImageLicenceLErrorState(error: e.toString()));
  //   });
  // }
  ///-------------End-----------
  String ?typeVehicle;
//Edit Profile
  Future uploadDocs({
    required String imagePathFace,
    required String licenceImagePathFace,
    required String carLicenceImagePathFace,
    required String carImagePathFace,
    required String type_Vehicle,
  }) async {
    emit(EditProfileLoading());
    try {
      await signUpRepositories
          .uploadDocuments(
          image: imagePathFace == "" ? "" : imagePathFace,
          driving_image: licenceImagePathFace== "" ? "" :licenceImagePathFace,
          driving_license: licenceImagePathFace== "" ? "" :licenceImagePathFace,
          car_image: carImagePathFace== "" ? "" :carImagePathFace,
          type_vehicle: typeVehicle.toString());
      emit(EditProfileLoaded());
      print("Ashraf " + imagePathFace.toString());
    } catch (e) {
      log(e.toString());
      emit(EditProfileError(e.toString()));
    }
  }
}
