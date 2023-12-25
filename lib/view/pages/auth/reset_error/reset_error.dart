import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:taoel_driver_app/view/pages/auth/autth_view.dart';
import 'package:taoel_driver_app/view/pages/auth/widget/gray_logo_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ResetError extends StatelessWidget {
  const ResetError({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            const GrayLogoBackground(),

            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: SizeConfig.defaultSize! * 30,
                    ),
                     Icon(Icons.close,size: 100.sp,color: Colors.red,),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 4,
                    ),
                    Text(
                      local!.resetError,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      local.resetErrorDesc,
                      style: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: SizeConfig.defaultSize! * 2,
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
                          icon: const Icon(Icons.arrow_back),
                          label: Text(local.resetErrorButton)),
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
