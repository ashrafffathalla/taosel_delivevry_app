import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:taoel_driver_app/view/pages/auth/reset_error/reset_error.dart';
import 'package:taoel_driver_app/view/pages/auth/widget/gray_logo_background.dart';
import 'package:animation_wrappers/animations/faded_slide_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/localization/language_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../provider/auth_cubit/auth_cubit.dart';
// import '../../../../provider/rent_car_cubit.dart/rent_car_cubit.dart';
import '../autth_view.dart';

class ResetDone extends StatelessWidget {
  const ResetDone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
           // const GrayLogoBackground(),
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.defaultSize! * 25.5,
                    ),
                     Icon(FontAwesomeIcons.checkCircle,color: Colors.green,size: 100.sp,),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 5,
                    ),
                    Text(
                      local!.done,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      local.doneDesc,
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 7,
                    ),
                    Container(
                      width: SizeConfig.defaultSize! * 30,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff065BFF), Color(0xff161EEE)], // Define your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                      ),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      const AuthView()),
                              (route) => false);
                        },
                        icon:const Row(
                          children: [
                             Icon(Icons.arrow_circle_right,color: Colors.white,),
                          ],
                        ),
                        label: Text(local.doneButton,style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp
                        ),),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
