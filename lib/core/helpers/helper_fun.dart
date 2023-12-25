import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../view/widgets/ad_dialog.dart';

class HelperFunctions {
  static void showFlashBar({
    required BuildContext context,
    required String title,
    required String message,
    required IconData icon,
    Color ?color,
    Color ?titlcolor,
    Color ?iconColor,
    bool showProgressIndicator = true,
  }) {
    showFlash(
      context: context,
      duration: const Duration(milliseconds: 3000),
      builder: (context, controller) {
        return FlashBar(
            margin:  EdgeInsets.symmetric(horizontal: 10.0.sp,),
            // borderRadius: const BorderRadius.all(Radius.circular(4)),
            forwardAnimationCurve: Curves.easeOutBack,
            reverseAnimationCurve: Curves.slowMiddle,
            backgroundColor: color,
            controller: controller,
            position: FlashPosition.top,
            title: Text(title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: titlcolor,fontSize: 14.sp)),
            content: Text(message, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: titlcolor,fontSize: 14.sp)),
            icon: Icon(icon, color: iconColor),
            // showProgressIndicator: showProgressIndicator,
        );
      },
    );
  }

  static dialog({
    required BuildContext context,
    required String title,
    required String body,
  }) => showDialog(context: context,
          builder: (context) => ADErrorDialog(title: title, body: body));

  static statusDialog({
    required BuildContext context,
    required bool status,
  }) => showDialog(context: context,
          builder: (context) => ADStatusDialog(status: status));
}
