import 'dart:io';
import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:taoel_driver_app/provider/auth_cubit/auth_cubit.dart';
import 'package:taoel_driver_app/view/widgets/custom_text_feild.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../../../../core/validation/form_validator.dart';

// import '../../../../data/model/country_model.dart';
import '../../../../provider/auth_cubit/auth_state.dart';
import '../../../../shared/shared_commponents/commponents.dart';
import '../autth_view.dart';
import '../otp/otp.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController userNameController;

  late TextEditingController passwordController;

  late TextEditingController confirmPasswordController;

  late TextEditingController phoneController;
  late TextEditingController licenseIdController;

  late TextEditingController emailController;
  bool isAgreeTerms = false;
  final _formKey = GlobalKey<FormState>();

  // CountryModel? countryModel;
  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    licenseIdController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final Size size = MediaQuery.of(context).size;
    final local = AppLocalizations.of(context);
    // BlocProvider.of<AuthCubit>(context).getCountry();
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterStateError) {
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
                                child: Icon(Icons.warning_amber,size: 50,color: Colors.red,)),
                          ],
                        ),
                        content: Text(
                          state.error.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    });
          }
          if (state is AuthLoaded) {
            /* navigateAndFinish(context, const AuthView());
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
                });*/

            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTP(
                        namePage: "signUp",
                        phone: phoneController.text,
                      )),
            );
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<AuthCubit>(context);
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal:size.width*0.05,vertical: size.height*0.07 ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        local!.signUp.toString(),
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      Text(
                        CheckLocal.isDirectionRTL(context)
                            ? "املأ البيانات لانشاء حسابك "
                            : "Complete All Fields",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 0.03.sh,
                      ),
                      CustomTextFeild(
                        controller: userNameController,
                        type: TextInputType.name,
                        label: local.fullName,
                        pIcon: LineAwesomeIcons.user,
                        validat: (value) =>
                            FormValidator.nameValidate(context, value),
                      ),

                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      CustomTextFeild(
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(11),
                        ],
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: CheckLocal.isDirectionRTL(context)
                            ? ' الهاتف'
                            : 'Phone',
                        pIcon: LineAwesomeIcons.mobile_phone,
                        validat: (value) =>
                            FormValidator.phoneValidate(context, value),
                        // preText: CheckLocal.isDirectionRTL(context)
                        //     ? '|  20 +'
                        //     : ' + 20 | ',

                        // sIcon: Padding(
                        //   padding: EdgeInsets.only(top: 15.sp,bottom: 15.sp,),
                        //   child: SvgPicture.asset('assets/images/ksa.svg',),
                        // ),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      CustomTextFeild(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: local.emailAddress,
                        pIcon: LineAwesomeIcons.envelope,
                        validat: (value) =>
                            FormValidator.emailValidate(context, value),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      CustomTextFeild(
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        label: local.password,
                        pIcon: LineAwesomeIcons.lock,
                        validat: (value) =>
                            FormValidator.passwordValidate(context, value),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      CustomTextFeild(
                        controller: confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        label: local.confirmPassword,
                        pIcon: LineAwesomeIcons.lock,
                        validat: (value) =>
                            FormValidator.passwordConfirmValidate(
                          context,
                          passwordController.text,
                          value,
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.defaultSize! * 2,
                      ),
                      SizedBox(
                        height: Platform.isIOS
                            ? SizeConfig.defaultSize! * 1
                            : SizeConfig.defaultSize! * .5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            data: ThemeData(
                                primarySwatch: Colors.blue,
                                unselectedWidgetColor:
                                    Theme.of(context).colorScheme.primary),
                            child: Transform.scale(
                              scale: 1,
                              child: Checkbox(
                                  value: isAgreeTerms,
                                  onChanged: (value) {
                                    setState(() {
                                      isAgreeTerms = value!;

                                    });
                                  }),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Navigator.of(context).push(MaterialPageRoute(
                              //     builder: (_) => PrivacyPolicy()));
                            },
                            child: Text(
                              local.agreeTermsAndConditions.toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Platform.isIOS
                            ? SizeConfig.defaultSize! * 1
                            : SizeConfig.defaultSize! * 0.5,
                      ),
                      state is AuthLoading
                          ? const Center(
                              child: CircularProgressIndicator.adaptive(),
                            )
                          : SizedBox(
                              width: SizeConfig.defaultSize! * 35,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  // side: BorderSide(color: Colors.red)
                                ))),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate() &&
                                      isAgreeTerms == true) {
                                    await cubit.signUp(
                                      name: userNameController.text,
                                      email: emailController.text,
                                      phone: phoneController.text,
                                      password: passwordController.text,
                                      password_confirmation: passwordController.text,
                                    );
                                    // BlocProvider.of<LanguageCubit>(context)
                                    //     .selectEngLanguage();
                                  }
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(builder: (context) => OnBoarding()),
                                  // );
                                },
                                child: Text(
                                  local.signUp,
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.white),
                                ),
                              ),
                            ),
                      SizedBox(height: 50.sp),
                      // SizedBox(
                      //   height: SizeConfig.defaultSize! * 0.05,
                      // )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
