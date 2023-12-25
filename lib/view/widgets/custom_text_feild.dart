import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFeild extends StatefulWidget {
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
  final  preText;
  final String? hint;
  final List<TextInputFormatter>? inputFormatters;
  bool ? waletScreen;

  final double sizeText;

   CustomTextFeild(
      {Key? key,
      this.maxlenth,
      this.preText,
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
      this.waletScreen,
      this.sizeText = 16})
      : super(key: key);

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
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
    return TextFormField(
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      validator: widget.validat,
      onTap: widget.onTap,
      enabled: widget.isClickable,
      onFieldSubmitted: widget.oFS,
      maxLength: widget.maxlenth,
      obscureText: widget.type == TextInputType.visiblePassword ? !isShow : isShow,
      keyboardType: widget.type,
      style: TextStyle(fontSize: 20.sp),
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        counterText: "",
        contentPadding:  EdgeInsets.all(8.0.sp),
        // focusedBorder: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(0.sp),
        //     borderSide:const BorderSide(
        //         color: Color(0xffFFD451),
        //         width: 1.0)
        // ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        errorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error.withOpacity(0.3),
                width: 1.0)),
        focusedErrorBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(50.sp),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.error.withOpacity(0.3),
                width: 1.0)),

        filled: true,
        label: Text(
            widget.label,
          style: TextStyle(
            fontSize: widget.waletScreen==true?13.sp:14.sp,
            fontWeight: FontWeight.w400

          ),
        ),

        // prefixText: widget.preText.toString(),
       // prefixText: CheckLocal.isDirectionRTL(context)?'':widget.type == TextInputType.phone?widget.preText.toString():'',
       //  suffixText: CheckLocal.isDirectionRTL(context)?widget.type == TextInputType.phone?widget.preText.toString():'':null,
        suffixStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,),
        prefixStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.sp,),



        labelStyle: Theme.of(context).textTheme.bodyMedium,
        hintText: widget.hint,
        prefixIcon: Icon(
          widget.pIcon,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        ),
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
    );
  }
}
