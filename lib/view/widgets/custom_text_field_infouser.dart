import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFeildAccInfo extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validat;
  final TextInputType type;
  final Function()? onTap;
  final Function(String)? oFS;
  final int? maxlenth;
  final String label;
  final IconData? pIcon;
  final dynamic sIcon;
  final Function()? sOnTap;
  final bool isClickable;

  final String? hint;
  final List<TextInputFormatter>? inputFormatters;

  final double sizeText;

  const CustomTextFeildAccInfo(
      {Key? key,
        this.maxlenth,

        required this.controller,
        this.validat,
        required this.type,
        this.onTap,
        this.oFS,
        required this.label,
        this.pIcon,
        this.sIcon,
        this.sOnTap,
        this.isClickable = true,
        this.hint,
        this.inputFormatters,
        this.sizeText = 14})
      : super(key: key);

  @override
  State<CustomTextFeildAccInfo> createState() => _CustomTextFeildAccInfo();
}

class _CustomTextFeildAccInfo extends State<CustomTextFeildAccInfo> {
  late bool isShow;
  changeVisibility() {
    setState(() {
      isShow = !isShow;
    });
  }

  @override
  void initState() {
    isShow = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0.0),
      child: TextFormField(
        textAlign: TextAlign.start,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        validator: widget.validat,
        onTap: widget.onTap,
        enabled: widget.isClickable,
        onFieldSubmitted: widget.oFS,
        maxLength: widget.maxlenth,
        obscureText:
        widget.type == TextInputType.visiblePassword ? !isShow : isShow,
        keyboardType: widget.type,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: widget.sizeText),
        // : Theme.of(context).textTheme.headline5!.copyWith(fontSize: 25),

        decoration: InputDecoration(
          counterText: "",
          contentPadding:  EdgeInsets.all(10.0.sp),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.sp),
              borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.sp),
              borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.3),
                  width: 1.0)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.sp),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.3),
                  width: 1.0)),
          fillColor:  Colors.transparent,
          //prefixText: widget.preText.toString(),
          // suffixText: CheckLocal.isDirectionRTL(context)?widget.type == TextInputType.phone?widget.preText.toString():'':null,
          suffixStyle: TextStyle(fontWeight: FontWeight.bold,),
          prefixStyle: TextStyle(fontWeight: FontWeight.bold,),
          labelStyle: Theme.of(context).textTheme.bodyMedium,
          hintText: widget.hint,
          // prefixIcon: Icon(
          //   widget.pIcon,
          //   color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
          // ),
          suffixIcon: widget.type == TextInputType.visiblePassword
              ? IconButton(
            onPressed: changeVisibility,
            icon: Icon(
              isShow ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ),
          )
              : widget.sIcon,
        ),
      ),
    );
  }
}
