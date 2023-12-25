import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoel_driver_app/shared/shared_commponents/commponents.dart';
import 'package:taoel_driver_app/view/widgets/customMainBtn.dart';
import '../../../core/localization/language_cubit.dart';
import '../../../data/local/hiva_helper.dart';
import '../../../provider/auth_cubit/auth_cubit.dart';
// import '../../../provider/rent_car_cubit.dart/rent_car_cubit.dart';
import 'login/login.dart';
import 'sign_up/sign_up.dart';
import 'widget/background.dart';

class AuthView extends StatefulWidget {
  const AuthView({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  int index = 0;

  @override
  void initState() {
    super.initState();
    // HiveHelper().removeData("token");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final local = AppLocalizations.of(context)!;
    final Size size = MediaQuery.of(context).size;
    return  Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal:size.width*0.05,vertical: size.height*0.07 ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: size.height*0.02,),
              Text(local.signIn.toString(),style: TextStyle(
                fontSize: 16.sp,
              ),),
              SizedBox(height: 0.03.sh,),
              Text(CheckLocal.isDirectionRTL(context)?"مرحبا بعودتك مرة اخري ":"Welcome Back Again",style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700
              ),),
              SizedBox(height: 0.03.sh,),
              const Login(),
              SizedBox(height: 0.03.sh,),

              SizedBox(height: 0.02.sh,),
              SizedBox(height: 0.025.sh,),
              InkWell(
                onTap: (){
                  navigateTo(context,const SignUp());
                },
                child: Text(CheckLocal.isDirectionRTL(context)?"ليس لديك حساب ؟ انشئ حساب الآن":"Don't Have Account ? Create Account",
                style: TextStyle(
                  color:const Color(0xffF96817),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
