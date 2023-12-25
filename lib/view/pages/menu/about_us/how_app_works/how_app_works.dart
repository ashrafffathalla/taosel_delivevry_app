import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/localization/check_local.dart';
import '../../../../../core/size_config/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HowAppWorks extends StatefulWidget {
  const HowAppWorks({Key? key}) : super(key: key);

  @override
  State<HowAppWorks> createState() => _HowAppWorksState();
}

class _HowAppWorksState extends State<HowAppWorks> {
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
                  padding: EdgeInsets.symmetric(horizontal: 15),
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
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 6,
                ),
                Center(
                  child: Text(
                    CheckLocal.isDirectionRTL(context)?
                    'خطوات الحجز':'Booking Steps',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.defaultSize! * 3,
                ),
                /*Image.asset("assets/images/appwork.jpg")*/

                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      width: SizeConfig.defaultSize! * 37,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Stepper(
                              physics: const BouncingScrollPhysics(),
                              // onStepTapped: null,
                              currentStep: 20,
                              controlsBuilder:
                                  (BuildContext ctx, ControlsDetails dtl) {
                                return const SizedBox();
                              },
                              steps: [
                                Step(
                                  isActive: true,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/login.svg"),
                                      SizedBox(
                                        width: SizeConfig.defaultSize! * 1,
                                      ),
                                      Expanded(child: Text(local!.work1))
                                    ],
                                  ),
                                  content: const Text(""),
                                ),
                                Step(
                                  isActive: true,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/choose.svg"),
                                      SizedBox(
                                        width: SizeConfig.defaultSize! * 1,
                                      ),
                                      Expanded(
                                        child: Text(local.work2),
                                      )
                                    ],
                                  ),
                                  content: const Text(""),
                                ),
                                Step(
                                  isActive: true,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/favCar.svg"),
                                      SizedBox(
                                        width: SizeConfig.defaultSize! * 1,
                                      ),
                                      Expanded(child: Text(local.work3))
                                    ],
                                  ),
                                  content: const Text(""),
                                ),
                                Step(
                                  isActive: true,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset("assets/images/pay.svg"),
                                      SizedBox(
                                        width: SizeConfig.defaultSize! * 1,
                                      ),
                                      Expanded(child: Text(local.work4))
                                    ],
                                  ),
                                  content: const Text(""),
                                ),
                                Step(
                                  isActive: true,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/getCar.svg"),
                                      SizedBox(
                                        width: SizeConfig.defaultSize! * 1,
                                      ),
                                      Expanded(
                                        child: Text(local.work5),
                                      )
                                    ],
                                  ),
                                  content: const Text(""),
                                ),
                                Step(
                                  isActive: true,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset("assets/images/QR.svg"),
                                      SizedBox(
                                        width: SizeConfig.defaultSize! * 1,
                                      ),
                                      Expanded(
                                        child: Text(local.work6),
                                      )
                                    ],
                                  ),
                                  content: const Text(""),
                                ),
                                Step(
                                  isActive: true,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/takeImage.svg"),
                                      SizedBox(
                                        width: SizeConfig.defaultSize! * 1,
                                      ),
                                      Expanded(
                                        child: Text(local.work7),
                                      )
                                    ],
                                  ),
                                  content: const Text(""),
                                ),
                                Step(
                                  isActive: true,
                                  title: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/trip.svg"),
                                      SizedBox(
                                        width: SizeConfig.defaultSize! * 1,
                                      ),
                                      Expanded(child: Text(local.work8))
                                    ],
                                  ),
                                  content: const Text(""),
                                ),
                              ]),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
