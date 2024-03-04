import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoel_driver_app/provider/uploadDocument_cubit/uploadDocumentStates.dart';
import '../../../../core/size_config/size_config.dart';
import '../../../../provider/uploadDocument_cubit/uploadDocumentCubit.dart';

class UploadDocuments extends StatelessWidget {
  UploadDocuments({super.key});

  final List<String> genderItems = [
    'سيارة',
    'دراجه نارية',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = UploadDocumentCubit.get(context);
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<UploadDocumentCubit, UploadDocumentState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Text(
                      'ارفع مستنداتك لمراجعه حسابك',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      'ارفع مستنداتك لمراجعه حسابك',
                      style: TextStyle(fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    GestureDetector(
                        onTap: () {
                          cubit.getImage();
                        },
                        child: buildList(
                            'الصورة الشخصية ',
                            cubit.imagePathFace.isEmpty
                                ? 'assets/images/up.jpg'
                                : 'assets/images/sended.png')),
                    GestureDetector(
                        onTap: () {
                          cubit.getLicenceImage();
                        },
                        child: buildList(
                            'رخصة القيادة ',
                            cubit.licenceImagePathFace.isEmpty
                                ? 'assets/images/up.jpg'
                                : 'assets/images/sended.png')),
                    GestureDetector(
                        onTap: () {
                          cubit.getCarLicenceImage();
                        },
                        child: buildList(
                            'رخصة المركبه  ',
                            cubit.carLicenceImagePathFace.isEmpty
                                ? 'assets/images/up.jpg'
                                : 'assets/images/sended.png')),
                    GestureDetector(
                        onTap: () {
                          cubit.getCarImage();
                        },
                        child: buildList(
                            'صورة المركبه  ',
                            cubit.carImagePathFace.isEmpty
                                ? 'assets/images/up.jpg'
                                : 'assets/images/sended.png')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'أختر نوع المركبه',
                          style: TextStyle(),
                        ),
                        SizedBox(
                          child: Container(
                            width: size.width * 0.3,
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                // Add more decoration..
                              ),
                              hint: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'أختر',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: Colors.grey,
                                      fontFamily: 'Cairo'),
                                ),
                              ),
                              items: genderItems
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w),
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'من فضلك اختر نوع المركبه';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                selectedValue = value.toString();
                                selectedValue=='دراجه نارية'?cubit.typeVehicle='2': cubit.typeVehicle='1';
                                },
                              onSaved: (value) {
                                selectedValue = value.toString();

                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff065BFF), Color(0xff161EEE)],
                          // Define your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(
                            8.0), // Adjust the border radius as needed
                      ),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              )),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              cubit.uploadDocs(
                                  imagePathFace: cubit.imagePathFace,
                                  licenceImagePathFace:
                                      cubit.licenceImagePathFace,
                                  carLicenceImagePathFace:
                                      cubit.carLicenceImagePathFace,
                                  carImagePathFace: cubit.carImagePathFace,
                                  type_Vehicle: cubit.typeVehicle.toString());
}
                          },
                          child: state is EditProfileLoading?CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                          ):Text(
                            'ارسال',
                            style:
                                TextStyle(fontSize: 18.sp, color: Colors.white),
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildList(String title, String image) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16.sp),
            ),
            Image.asset(image),
          ],
        ),
      );
}
