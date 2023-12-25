import 'package:taoel_driver_app/view/pages/menu/support/contact_us/widget/contact_info.dart';
import 'package:taoel_driver_app/view/pages/menu/support/contact_us/widget/contact_social.dart';
import 'package:taoel_driver_app/view/widgets/background_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../core/size_config/size_config.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return BackgroundHome(
        screan: Scaffold(
      backgroundColor: Colors.white.withOpacity(0),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.close,
                size: 25,
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        toolbarHeight: SizeConfig.screenHeight! * 0.08,
        backgroundColor: Colors.white.withOpacity(0),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SvgPicture.asset(
              "assets/images/logo.svg",
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: SizeConfig.defaultSize! * 6,
          ),
          Center(
            child: Text(
              local!.contactUs,
              style:  TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: SizeConfig.defaultSize! * 4,
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ContactInfo(),
                SizedBox(height: 15.sp,),
                ContactSocial(),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}
