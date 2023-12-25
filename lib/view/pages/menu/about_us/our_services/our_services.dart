import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taoel_driver_app/view/pages/home/layout.dart';

import '../../../../../core/localization/check_local.dart';
import '../../../../../core/size_config/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OurServices extends StatelessWidget {
  const OurServices({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.symmetric(horizontal: 0),
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: SizeConfig.defaultSize! * 6,
                ),
                Center(
                  child: Text(
                    local!.ourServices,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                // SizedBox(
                //   height: SizeConfig.defaultSize! * 2,
                // ),
                // Container(
                //     child: Column(
                //   children: [
                //     SvgPicture.asset(
                //       "assets/images/serviceIcon.svg",
                //     ),
                //     Container(
                //       padding: EdgeInsets.all(20),
                //       decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               color: Colors.grey.withOpacity(0.1),
                //               spreadRadius: 2,
                //               blurRadius: 4,
                //               offset: Offset(0, 3),
                //             )
                //           ],
                //           borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(100),
                //             topRight: Radius.circular(100),
                //           ),
                //           border: Border.all(
                //               color: Theme.of(context).colorScheme.primary)),
                //       child: Column(
                //         children: [
                //           Text(
                //             local.chauffeurRent,
                //             style: TextStyle(
                //                 fontSize: 16, fontWeight: FontWeight.bold),
                //           ),
                //           SizedBox(
                //             height: SizeConfig.defaultSize! * 2,
                //           ),
                //           Text(
                //             local.chauffeurDesc,
                //             textAlign: TextAlign.center,
                //           ),
                //           SizedBox(
                //             height: SizeConfig.defaultSize! * 2,
                //           ),
                //           SizedBox(
                //               width: SizeConfig.defaultSize! * 15,
                //               child: ElevatedButton(
                //                   onPressed: () {
                //                     Navigator.push(
                //                         context,
                //                         MaterialPageRoute(
                //                             builder: (context) =>
                //                                 const Home()));
                //                   },
                //                   child: Text(local.tryButton))),
                //         ],
                //       ),
                //     ),
                //   ],
                // )),
                SizedBox(
                  height: SizeConfig.defaultSize! * 4,
                ),
                Container(
                    child: Column(
                  children: [
                    SvgPicture.asset("assets/images/serviceIcon.svg"),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100),
                          ),
                          border: Border.all(
                              color: Theme.of(context).colorScheme.primary)),
                      child: Column(
                        children: [
                          Text(
                            local.selfDriveRent,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.defaultSize! * 2,
                          ),
                          Text(
                            local.selfDriveDesc,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: SizeConfig.defaultSize! * 2,
                          ),
                          SizedBox(
                              width: SizeConfig.defaultSize! * 15,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LayoutScreen()));
                                  },
                                  child: Text(local.tryButton))),
                        ],
                      ),
                    ),
                  ],
                )),
              ]),
            ),
          ),
        ),
      ],
    );
  }
}
