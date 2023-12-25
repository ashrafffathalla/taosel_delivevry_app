import 'package:taoel_driver_app/view/pages/menu/about_us/privacy_policy/widget/text_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/localization/check_local.dart';
import '../../../../../core/size_config/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return Stack(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          height: SizeConfig.screenHeight,
          width: double.infinity,
        ),
        CheckLocal.isDirectionRTL(context)
            ? Positioned(
                // top: -50,
                right: -110,
                width: MediaQuery.of(context).size.width * 1.5,
                child: SvgPicture.asset(
                    alignment: Alignment.topCenter,
                    "assets/images/HomeCurveAr.svg"))
            : Positioned(
                // top: -50,
                left: -110,
                width: MediaQuery.of(context).size.width * 1.5,
                child: SvgPicture.asset(
                  "assets/images/HomeCurve.svg",
                  alignment: Alignment.topCenter,
                ),
              ),
        Scaffold(
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
            children: [
              SizedBox(
                height: SizeConfig.defaultSize! * 6,
              ),
              Center(
                child: Text(
                  local!.policies,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: SizeConfig.defaultSize! * 4,
              ),
              Expanded(
                child: RawScrollbar(
                  thumbVisibility: true,
                  trackVisibility: true,
                  thumbColor: Theme.of(context).colorScheme.primary,
                  thickness: 15,
                  trackRadius: Radius.circular(50),
                  radius: Radius.circular(50),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextContainer(
                          title: local.foreword,
                          description: local.forewordDesc,
                        ),
                        TextContainer(
                            title: local.rights, description: local.rightsDesc),
                        TextContainer(
                            title: local.natureOfApp,
                            description: local.natureOfAppDesc),
                        TextContainer(
                            title: local.useOfApp,
                            description: local.useOfAppDesc),
                        TextContainer(
                            title: local.registrationMechanism,
                            description: local.registrationMechanismDesc),
                        TextContainer(
                            title: local.companyApp,
                            description: local.companyAppDesc),
                        TextContainer(
                            title: local.disclaimers,
                            description: local.disclaimersDesc),
                        TextContainer(
                            title: local.privacy,
                            description: local.privacyDesc),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
