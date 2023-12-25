import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;
import '../../core/localization/check_local.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({Key? key, this.topPosition = 160, required this.ontap})
      : super(key: key);
  final Function()? ontap;
  final double topPosition;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topPosition,
      right: CheckLocal.isDirectionRTL(context) ? 0 : null,
      left: CheckLocal.isDirectionRTL(context) ? null : 0,
      child: GestureDetector(
        onTap: ontap,
        child: Transform(
          alignment: Alignment.center,
          transform: CheckLocal.isDirectionRTL(context)
              ? Matrix4.rotationY(math.pi)
              : Matrix4.rotationX(math.pi / 90),
          child: SvgPicture.asset(
            "assets/images/arrow.svg",
            height: 70.sp,
            width: 100.sp,
          ),
        ),
      ),
    );
  }
}
