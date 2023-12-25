import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/localization/check_local.dart';
import '../../../../../../core/size_config/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.05),
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            margin: EdgeInsets.only(top: 20.sp, left: 5.sp, right: 5.sp, bottom: 5.sp),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 10, left: 10, top: 45, bottom: 40),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: SvgPicture.asset(
                              "assets/images/location_icon.svg")),
                      Expanded(flex: 4, child: Text(local!.address)),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child:
                              SvgPicture.asset("assets/images/phone_icon.svg")),
                      Expanded(flex: 4, child: Text(CheckLocal.isDirectionRTL(context)?"557492493 966+":"+966 557492493")),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.defaultSize! * 1,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child:
                              SvgPicture.asset("assets/images/email_icon.svg")),
                      Expanded(flex: 4, child: Text("support@4go.abudiyab.com.sa")),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0.sp),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).colorScheme.secondary,
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(97, 52, 44, 82),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(
                        1.0, // Move to right 10  horizontally
                        1.0,
                      ),
                    )
                  ]),
              child: Text(
                local.info,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
