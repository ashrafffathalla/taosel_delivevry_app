import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:taoel_driver_app/view/pages/auth/reset_password/reset_password.dart';
// import 'package:taoel_driver_app/view/pages/home/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taoel_driver_app/view/pages/home/layout.dart';
import 'dart:math' as math;
import '../../../../core/localization/check_local.dart';
import '../../../../core/localization/language_cubit.dart';
import '../../../../core/validation/form_validator.dart';
import '../../../../data/local/hiva_helper.dart';
import '../../../../provider/auth_cubit/auth_cubit.dart';
import '../../../../provider/auth_cubit/auth_state.dart';
import '../../../../shared/shared_commponents/commponents.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_text_feild.dart';
import '../autth_view.dart';
import '../widget/background.dart';

class OTP extends StatefulWidget {
  const OTP({Key? key, required this.namePage, this.phone = ""})
      : super(key: key);
  final String namePage;
  final String phone;

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  final phoneController = TextEditingController();
  final otpControler = TextEditingController();
  String currentText = "";
  bool emailCreated = true;

  @override
  void initState() {
    super.initState();
    phoneController.text = widget.phone;
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is ChangePhoneLoaded) {
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
                            child:
                                Icon(LineAwesomeIcons.check_circle,color: Colors.green,)),
                      ],
                    ),
                    content: Center(
                      child: Text(
                        CheckLocal.isDirectionRTL(context)
                            ? "تم تغيير الرقم السري"
                            : "Change Password Done",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                });
          }
          if (state is AuthLoaded) {
            if (widget.namePage == "signUp") {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const LayoutScreen()),
                  (route) => false);
              showDialog(
                  context: context,
                  builder: (context) {
                    Future.delayed(const Duration(seconds: 3), () {
                      Navigator.pop(context);
                    });
                    return AlertDialog(
                      title:
                          //  Center(child: Icon(Icons.close,color: Colors.orangeAccent,)),
                          Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              GestureDetector(
                                child:const  Icon(
                                  Icons.close,
                                  color: Colors.black87,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
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
                            ? 'تم انشاء البريد الالكتروني بنجاح'
                            : 'Email has been created successfully',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  });
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetPassword()));
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [

                    SizedBox(
                      height: size.height*0.08,
                    ),
                    Text(widget.namePage == "signUp"?"التحقق من الهاتف":local!.resetPassword.toString(),style: TextStyle(
                      fontSize: 16.sp,
                    ),),
                    SizedBox(height: 0.09.sh,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform(
                          transform: CheckLocal.isDirectionRTL(context)
                              ? Matrix4.rotationX(math.pi / 90)
                              : Matrix4.rotationX(math.pi / 120),
                          child: Icon(
                            Icons.message,
                            size: SizeConfig.defaultSize! * 6,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.defaultSize! * 2,
                        ),
                        RichText(
                          text: TextSpan(
                            text: local!.otpCode,
                            style: CheckLocal.isDirectionRTL(context)
                                ? Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 19,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        height: SizeConfig.defaultSize! * 0.22),
                            children: <TextSpan>[
                              TextSpan(
                                  text: local.otpDesc,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal)),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    widget.namePage == "signUp"
                        ?const Padding(
                            padding:
                                 EdgeInsets.symmetric(horizontal: 30.0),
                          )
                        : const SizedBox.shrink(),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 55.0, vertical: 20.0),
                        child: Directionality(
                          textDirection: CheckLocal.isDirectionRTL(context)
                              ? TextDirection.ltr
                              : TextDirection.ltr,
                          child: PinCodeTextField(
                            autoFocus: true,
                            length: 4,
                            obscureText: false,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                              inactiveColor:
                                  Theme.of(context).colorScheme.secondary,
                              selectedColor:
                                  Theme.of(context).colorScheme.primary,
                              inactiveFillColor: Colors.white,
                              selectedFillColor: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.3),
                              shape: PinCodeFieldShape.box,
                              fieldOuterPadding: const EdgeInsets.all(0.0),
                              borderRadius: BorderRadius.circular(3),
                              fieldHeight: 50.sp,
                              fieldWidth: 50.sp,
                              activeColor:
                                  Theme.of(context).colorScheme.primary,
                              activeFillColor: Colors.white,
                            ),
                            animationDuration:
                                const Duration(milliseconds: 300),
                            enableActiveFill: true,
                            controller: otpControler,
                            onCompleted: (v) {},
                            onChanged: (value) {
                              setState(() {
                                currentText = value;
                                if (currentText.length == 4) {

                                }
                              });
                            },
                            beforeTextPaste: (text) {
                              return true;
                            },
                            appContext: context,
                          ),
                        )),
                    SizedBox(
                      height: 5.h,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(
                    //       horizontal: MediaQuery.of(context).size.width * 0.09),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         local.sendAgain,
                    //         style: TextStyle(
                    //             color: Colors.black,
                    //             fontSize: 16.sp,
                    //             fontWeight: FontWeight.w600),
                    //       ),
                    //       SizedBox(
                    //         width: 4,
                    //       ),
                    //       InkWell(
                    //           onTap: () {
                    //             BlocProvider.of<AuthCubit>(context)
                    //                 .sendAgain(phone: widget.phone.toString());
                    //           },
                    //           child: Text(
                    //             local.sendAgain2,
                    //             style: TextStyle(
                    //                 color:
                    //                     Theme.of(context).colorScheme.primary,
                    //                 fontSize: 15.sp,
                    //                 fontWeight: FontWeight.w600),
                    //           )),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2.5,
                    ),
                    state is AuthLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
                        width: SizeConfig.defaultSize! * 30,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xff065BFF), Color(0xff161EEE)], // Define your gradient colors
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                        ),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8.0),
                                          // side: BorderSide(color: Colors.red)
                                        )
                                    ),backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)),
                                onPressed: () {
                                  if (currentText.length == 4) {
                                    BlocProvider.of<AuthCubit>(context)
                                        .checkOtp(otpControler.text);
                                    }
                                  // if (HiveHelper().getData("sendAgainToken") !=
                                  //     null) {
                                  //   BlocProvider.of<AuthCubit>(context)
                                  //       .againCheckOtp(otpControler.text);
                                  //   emailCreated = false;
                                  //   setState(() {
                                  //     print(emailCreated.toString());
                                  //   });
                                  // } else {
                                  //   HiveHelper().getData("tokenRegister") !=
                                  //           null
                                  //       ? BlocProvider.of<AuthCubit>(context)
                                  //           .checkOtp(otpControler.text)
                                  //       : BlocProvider.of<AuthCubit>(context)
                                  //           .checkOtpPass(otpControler.text);
                                  //   emailCreated = false;
                                  //   setState(() {
                                  //     print(emailCreated.toString());
                                  //   });
                                  // }
                                  //
                                  // print(HiveHelper()
                                  //     .getData('sendAgainToken')
                                  //     .toString());
                                },
                                child: Text(local.confirm,style:const TextStyle(
                                  color: Colors.white
                                ),))),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
