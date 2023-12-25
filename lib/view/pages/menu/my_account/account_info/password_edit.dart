import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/provider/profile_cubit/profile_cubit.dart';
import 'package:taoel_driver_app/shared/shared_commponents/commponents.dart';
import 'package:taoel_driver_app/view/widgets/background_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../../core/validation/form_validator.dart';
import '../../../../../data/local/hiva_helper.dart';

import '../../../../widgets/custom_text_feild.dart';
import '../../../auth/autth_view.dart';
import 'account_info_container.dart';

class PasswordEdit extends StatefulWidget {
  PasswordEdit({Key? key}) : super(key: key);

  @override
  State<PasswordEdit> createState() => _PasswordEditState();
}

class _PasswordEditState extends State<PasswordEdit> {
  String? token = HiveHelper().getData("token");

  late var newPasswordController = TextEditingController();
  late var confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfileData();

  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProfileCubit>(context).getProfileData();
    final local = AppLocalizations.of(context);
    // final cubit = BlocProvider.of<NavigatorCubit>(context);
    return Stack(
      children: [
        Container(
          color: Theme.of(context).colorScheme.background,
          height: SizeConfig.screenHeight,
          width: double.infinity,
        ),
        BackgroundHome(
          screan: Scaffold(
            backgroundColor: Colors.white.withOpacity(0),
            appBar: AppBar(
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.close,
                    size: 30.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(left: 15.sp, right: 15.sp, top: 20.sp),
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: 50.sp,
                  ),
                ),
              ],
              toolbarHeight: SizeConfig.screenHeight! * 0.08,
              backgroundColor: Colors.white.withOpacity(0),
            ),
            body: BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                // if (state is DeleteProfileSuccess) {
                //   showDialog(
                //       context: context,
                //       builder: (_) {
                //         return AlertDialog(
                //           title: Column(
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             children: [
                //               Center(
                //                   child: Icon(
                //                     Icons.check_circle,
                //                     color: Colors.green,
                //                     size: 30,
                //                   )),
                //             ],
                //           ),
                //           content: Text(
                //             'تم حذف الحساب بنجاح',
                //             textAlign: TextAlign.center,
                //           ),
                //         );
                //       });
                //   navigateAndFinish(context, AuthView());
                // }
                if (state is ProfileError) {
                  state.error.contains('تسجيل الدخول') ||
                      state.error.contains('logged in')
                      ? navigateAndFinish(context, AuthView())
                      : showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          content: Text(state.error.toString()),
                        );
                      });
                }
                if (state is UpdateProfileError) {
                  BlocProvider.of<ProfileCubit>(context).getProfileData();
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: SvgPicture.asset(
                                      'assets/images/infoIcon.svg')),
                            ],
                          ),
                          content: Text(
                            state.error
                                .toString()
                                .replaceAll('[', "")
                                .replaceAll(']', ""),
                            textAlign: TextAlign.center,
                          ),
                        );
                      });
                }


                if (state is UpdateProfileLoaded||state is UpdateAllProfileLoaded ) {
                  BlocProvider.of<ProfileCubit>(context).getProfileData().then((value) {
                        confirmPasswordController.clear();
                        newPasswordController.clear();
                     Navigator.pop(context);
                  });
                }
                if (state is UpdatePasswordProfileLoaded) {
                  BlocProvider.of<ProfileCubit>(context).getProfileData().then((value) {
                    confirmPasswordController.clear();
                    newPasswordController.clear();
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (context) {
                          Future.delayed(Duration(seconds: 3), () {
                            Navigator.pop(context);
                          });
                          return AlertDialog(
                            title:
                            //  Center(child: Icon(Icons.close,color: Colors.orangeAccent,)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                    child: Icon(
                                      Icons.check_circle,
                                      color: Colors.green,
                                      size: 50.sp,
                                    )),
                              ],
                            ),
                            content: Text(
                              CheckLocal.isDirectionRTL(context)
                                  ? 'تم تغيير الرقم السري بنجاح'
                                  : 'Password Changed                                                                                                                                                                                                                                                                                                                                  successfully',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          );
                        });
                  });
                }
              },
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                if (state is ProfileLoaded) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.defaultSize! * 6,
                        ),
                        Center(
                          child: Text(
                            local!.accountInfo,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              MediaQuery.of(context).size.width * 0.08,
                              vertical: 13.sp),
                          child: Center(
                            child: Text(
                              local.completeAccInfo,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 20.sp,
                        ),
                        Card(
                          color: Colors.white.withOpacity(0),
                          elevation: 0,
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                Container(
                                  height: 50.sp,
                                  color: Colors.blueGrey.withOpacity(0.3),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                            MediaQuery.of(context).size.width * 0.1),
                                        child: Text(local.editPassowrd,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 20.sp,
                                ),
                                Container(
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      AccountInfoContainer(
                                        isPasswordScreen: false,
                                        isEdit: true,
                                        widget:Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: SizeConfig.defaultSize! * 1,
                                            ),
                                            CustomTextFeild(
                                                controller: newPasswordController,
                                                type: TextInputType.name,
                                                validat: (value) =>
                                                    FormValidator.passwordValidate(context, value),
                                                label:CheckLocal.isDirectionRTL(context)?'كلمة المرور':'New Password',
                                                pIcon: Icons.password,
                                            ),
                                            SizedBox(
                                              height: SizeConfig.defaultSize! * 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      AccountInfoContainer(
                                        isPasswordScreen: false,
                                        isEdit: true,
                                        widget:Column(
                                          mainAxisSize:
                                          MainAxisSize.min,
                                          children: [
                                            SizedBox(height: SizeConfig.defaultSize! * 1,),
                                            Column(
                                              children: [
                                                CustomTextFeild(
                                                  controller:
                                                  confirmPasswordController,
                                                  validat: (value) => FormValidator.passwordConfirmValidate(context, newPasswordController.text,value),
                                                  type: TextInputType.name,
                                                  label: local.confirmPassword,
                                                  pIcon: Icons.password,
                                                ),
                                                SizedBox(
                                                  height: SizeConfig.defaultSize! * 1,
                                                ),
                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: SizeConfig.defaultSize! * 2.5,
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: SizeConfig.defaultSize! * 2.5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<ProfileCubit>(context).updateProfilePassword(newPasswordController.text,newPasswordController.text);
                                    }
                                  },
                                  child: Container(
                                    width: 80.sp,
                                    height: 40.sp,
                                    decoration:
                                    BoxDecoration(
                                      color: Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Center(
                                      child: Text(
                                        local.change,
                                        style: const TextStyle(
                                         color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return Container(
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Center(
                  //       child: Container(
                  //         height: 40.sp,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(12),
                  //           color: Colors.orangeAccent.withOpacity(0.9),
                  //         ),
                  //         child: TextButton(
                  //           child: Text(
                  //             CheckLocal.isDirectionRTL(context)
                  //                 ? 'العوده الي معلومات الحساب'
                  //                 : 'Back To Account Info',
                  //             style: TextStyle(
                  //               fontSize: 16.sp,
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //           onPressed: () {
                  //             Navigator.pop(context);
                  //           },
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now().subtract(const Duration(days: 0)),
    lastDate: DateTime(2100),
  );
}
