import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GrayLogoBackground extends StatelessWidget {
  const GrayLogoBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.defaultSize! * 40,
      decoration: BoxDecoration(

          //fbc112
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(200))),
      child: Container(
          alignment: Alignment.topCenter,
          margin:  EdgeInsets.symmetric(horizontal: 50, vertical: MediaQuery.of(context).size.height*0.08),
          child: SvgPicture.asset("assets/images/grayLogo.svg")),
    );
  }
}
