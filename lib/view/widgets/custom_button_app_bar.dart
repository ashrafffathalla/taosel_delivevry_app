import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import '../../core/localization/check_local.dart';

class CustomeButtonAppBar extends StatelessWidget {
  const CustomeButtonAppBar({Key? key, required this.ontap}) : super(key: key);
  final Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: ontap,
      icon: Transform(
        alignment: Alignment.center,
        transform: CheckLocal.isDirectionRTL(context)
            ? Matrix4.rotationY(math.pi)
            : Matrix4.rotationX(math.pi / 90),
        child: SvgPicture.asset(
          "assets/images/appBarArrow.svg",
          height: 28,
          width: 28,
        ),
      ),
    );
  }
}
