import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/localization/check_local.dart';
class AccountInfoContainer extends StatefulWidget {
  bool isPasswordScreen=false;
  final IconData? containerIcon;
  final Widget widget;
  final VoidCallbackAction? containerEdit;
  final bool isEdit;
   AccountInfoContainer({
  this.containerIcon,
    required this.widget,
    this.containerEdit,
    required this.isEdit,
     required this.isPasswordScreen,
    Key? key,
  }) : super(key: key);

  @override
  State<AccountInfoContainer> createState() => _AccountInfoContainerState();
}

class _AccountInfoContainerState extends State<AccountInfoContainer> {
  @override
  Widget build(BuildContext context) {

    return Container(
      margin:  EdgeInsets.symmetric(horizontal: 15.sp, vertical: 10.sp),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(97, 52, 44, 82),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(
                3.0, // Move to right 10  horizontally
                3.0,
                // Move to bottom 10 Vertically
              ), // changes position of shadow
            ),
          ],
          border: CheckLocal.isDirectionRTL(context)?Border(
              right: BorderSide(
                  color: Theme.of(context).colorScheme.primary, width: 8.sp,
              ),
          ):Border(
            left: BorderSide(
              color: Theme.of(context).colorScheme.primary, width: 8.sp,
            ),
          ),
      ),
      padding:  EdgeInsets.symmetric(horizontal: 7.sp, vertical: 7.sp),
      child: Row(
          children: [
        Expanded(flex: 1, child: Icon(widget.containerIcon)),
        Expanded(
            flex: widget.isPasswordScreen?6:30,
            child: widget.widget),

        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                widget.containerEdit!;
              },
              child: widget.isEdit
                  ?Container()
                  : Icon(
                      Icons.visibility,
                      color: Theme.of(context).colorScheme.primary,
                    ),
            )),
      ]),
    );
  }
}
