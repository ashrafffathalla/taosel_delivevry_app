import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/size_config/size_config.dart';
import 'dart:math' as math;

class BackgroundHome extends StatelessWidget {
  const BackgroundHome({Key? key, required this.screan}) : super(key: key);
  final Widget screan;
  @override
  Widget build(BuildContext context) {
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
                right: -135,
                width: MediaQuery.of(context).size.width * 1.5,
                child: SvgPicture.asset(
                    alignment: Alignment.topCenter,
                    "assets/images/HomeCurveAr.svg"))
            : Positioned(
                // top: -50,
                left: -135,
                width: MediaQuery.of(context).size.width * 1.5,
                child: SvgPicture.asset(
                  "assets/images/HomeCurve.svg",
                  alignment: Alignment.topCenter,
                ),
              ),
        screan,
      ],
    );
  }
}
