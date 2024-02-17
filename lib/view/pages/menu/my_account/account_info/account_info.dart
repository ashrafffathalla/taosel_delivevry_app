import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/provider/profile_cubit/profile_cubit.dart';
import 'package:taoel_driver_app/shared/shared_commponents/commponents.dart';
import 'package:taoel_driver_app/view/pages/home/layout.dart';
import 'package:taoel_driver_app/view/pages/menu/my_account/image_icence.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:hijri_picker/hijri_picker.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../../../../core/constant/lang_code.dart';
import '../../../../../core/validation/form_validator.dart';
import '../../../../../data/local/hiva_helper.dart';

import '../../../../../provider/auth_cubit/auth_cubit.dart';
import '../../../../widgets/custom_text_field_infouser.dart';
import '../../../auth/autth_view.dart';
import 'account_info_container.dart';
// import 'package:hijri/hijri_calendar.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;
class AccountInfo extends StatefulWidget {
  AccountInfo({Key? key}) : super(key: key);

  @override
  State<AccountInfo> createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  String? token = HiveHelper().getData("token");
  late var userNameController = TextEditingController();

  late var emailController = TextEditingController();

  late var phoneController = TextEditingController();
  bool switchValue = false;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileCubit>(context).getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<ProfileCubit>(context);
    BlocProvider.of<ProfileCubit>(context).getProfileData();
    final local = AppLocalizations.of(context);
    var cubit2 = BlocProvider.of<AuthCubit>(context);
    return Stack(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          height: SizeConfig.screenHeight,
          width: double.infinity,
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus( FocusNode());
          },
          child: Scaffold(
            backgroundColor: Colors.white,
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
                  padding:  EdgeInsets.symmetric(horizontal: 15.sp),
                  child: InkWell(
                    onTap: (){
                      _formKey.currentState!.validate();
                      BlocProvider.of<ProfileCubit>(context)
                          .updateAllFieldsAccInfo(
                        name: userNameController.text,
                        email: emailController.text,
                        phone: phoneController.text,
                        image: 'assets/images/person.png'.toString(),
                      );
                    },
                    child: Center(
                        child: Text(
                          local!.save,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold),
                        )),
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
                //                 Icons.check_circle,
                //                 color: Colors.green,
                //                 size: 30,
                //               )),
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
                }else if  (state is UpdateAllProfileLoaded) {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.black87,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                              const Center(
                                  child:  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 30,
                                  )),
                            ],
                          ),
                          content: Text(CheckLocal.isDirectionRTL(context)?'تم تحديث معلومات الحساب ':'Account Information Updated',textAlign: TextAlign.center,),
                        );
                      });
                }
                if (state is UpdateProfileError) {
                  BlocProvider.of<ProfileCubit>(context).getProfileData();
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: Icon(Icons.info)
                              ),
                            ],
                          ),
                          content: Text(
                            state.error.toString(),
                            textAlign: TextAlign.center,
                          ),
                        );
                      });
                }
                if (state is ProfileLoaded) {
                  userNameController.text = state.profileListData.data!.userName!;
                  emailController.text = state.profileListData.data!.email!;
                  phoneController.text = state.profileListData.data!.phone!;
                }

                if (state is UpdateProfileLoaded||state is UpdateAllProfileLoaded) {
                  BlocProvider.of<ProfileCubit>(context).getProfileData().then((value) {
                    //Navigator.pop(context);
                  });
                }
                if (state is UpdateAllProfileLoaded && makeToMakeOrder=="1") {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop(true);
                                    Navigator.of(context).pop(true);
                                    Navigator.of(context).pop(true);
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.32,
                                    height: 34.sp,
                                    decoration:
                                    BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.withOpacity(0.5),
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(15),
                                      color: Theme.of(context).colorScheme.primary,
                                    ),
                                    child: Center(
                                        child: Text(
                                          CheckLocal.isDirectionRTL(context) ? 'استكمال الطلب' : 'Continue Order',
                                          style: TextStyle(color: Colors.black),
                                        )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap:
                                      () {
                                    navigateAndFinish(context, LayoutScreen());
                                  },
                                  child:
                                  Container(
                                    width: MediaQuery.of(context).size.width * 0.32,
                                    height: 34.sp,
                                    decoration:
                                    BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.grey.withOpacity(0.3),
                                    ),
                                    child: Center(
                                        child: Text(CheckLocal.isDirectionRTL(context) ? 'لا' : 'Close', style: TextStyle(color: Colors.black))),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10.sp,
                            )
                          ],
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Center(
                                  child: SvgPicture.asset('assets/images/infoIcon.svg')),
                            ],
                          ),
                          content: SingleChildScrollView(
                            child: Text(
                              CheckLocal.isDirectionRTL(context)?"هل تريد استكمال الطلب ؟":"Do you want to complete the application?",
                              textAlign:
                              TextAlign.center,),
                          ),
                          titlePadding:
                          EdgeInsets.only(top: 10.sp, bottom:0),
                          actionsPadding:
                          EdgeInsets.only(top: 0),
                        );
                      });
                }
              },
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                return SingleChildScrollView(
                  // physics: BouncingScrollPhysics(),
                  child: GestureDetector(
                    onTap:(){FocusScope.of(context).requestFocus( FocusNode());},
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          SizedBox(
                            height: SizeConfig.defaultSize! * 1,
                          ),
                          Center(
                            child: Text(
                              local.accountInfo,
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
                                vertical: 10.sp),
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
                          Container(
                            height: 50.sp,
                            color: Colors.blueGrey.withOpacity(0.3),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                      MediaQuery.of(context).size.width * 0.1),
                                  child: Text(local.personalData,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15.sp,
                          ),
                          Card(
                            color: Colors.transparent,
                            elevation: 0,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width * 0.05),
                                      child: Text(local.fullName,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff424242,),),),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  containerIcon: Icons.account_box,
                                  widget: CustomTextFeildAccInfo(
                                    controller: userNameController,
                                    type: TextInputType.name,
                                    label: local.editName,
                                  ),

                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context).size.width * 0.05),
                                      child: Text(
                                        local.emailAddress,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          color: Color(0xff424242),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,

                                  isEdit: true,
                                  containerIcon: Icons.mail,
                                  widget: CustomTextFeildAccInfo(
                                    controller: emailController,
                                    type: TextInputType.name,
                                    label: local.editName,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                          MediaQuery.of(context).size.width * 0.05),
                                      child: Text(
                                          local.phoneNumber,
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: const Color(0xff424242))),
                                    ),
                                  ],
                                ),
                                AccountInfoContainer(
                                  isPasswordScreen: true,
                                  isEdit: true,
                                  containerIcon: Icons.phone,
                                  widget: Directionality(
                                    textDirection: ui.TextDirection.rtl,
                                    child: CustomTextFeildAccInfo(
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(9),
                                      ],
                                      validat: (value) =>
                                          FormValidator.phoneValidate(context, value),
                                      controller: phoneController,
                                      type: TextInputType.phone,
                                      label: local.editName,
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                );

              },
            ),
          ),
        ),
      ],
    );
  }

  Future<DateTime?> pickDate({
    required bool birthdate,
  }) => showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: birthdate?DateTime(1950,1):DateTime.now().subtract(const Duration(days: 0)),
    lastDate: DateTime(2100),
  );



}
