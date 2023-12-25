import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../../core/size_config/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactSocial extends StatelessWidget {
  const ContactSocial({Key? key}) : super(key: key);

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        const url = 'https://www.facebook.com/abudiyabsa';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child:
                          SvgPicture.asset("assets/images/facebook_icon.svg"),
                    ),
                    GestureDetector(
                        onTap: () async {
                          const url =
                              'https://www.linkedin.com/company/abudiyabsa/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: SvgPicture.asset(
                            "assets/images/linkedIn_icon.svg")),
                    GestureDetector(
                      onTap: () async {
                        const url =
                            'https://twitter.com/abudiyabrentcar?s=11&t=hDavfTiTfk1KFUkvcZlaAw';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: SvgPicture.asset("assets/images/twitter_icon.svg"),
                    ),
                    GestureDetector(
                        onTap: ()async{
                          const url = 'https://api.whatsapp.com/send/?phone=966557492493&text&type=phone_number&app_absent=0';
                          if(await canLaunch(url)){
                            await launch(url);
                          }else {
                            throw 'Could not launch $url';
                          }
                        },
                        child:  SvgPicture.asset("assets/images/whatsapp_icon.svg")),
                  ],
                )),
          ),
        ),
        Positioned(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0.sp),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 8.sp),
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
                    ),
                  ]),
              child: Text(
                CheckLocal.isDirectionRTL(context)?"وسائل التواصل":"Social Media",
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
