import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/core/size_config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackGround extends StatelessWidget {
  const BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: SizeConfig.defaultSize! * 45,
      decoration: BoxDecoration(
          //fbc112
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(200),
              bottomRight: Radius.circular(200))),
      child: Container(
          alignment: Alignment.topCenter,
          padding:EdgeInsets.only(right:MediaQuery.of(context).size.width*0.02,left:MediaQuery.of(context).size.width*0.02, top: 70.sp),
          child: Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Text(
                        CheckLocal.isDirectionRTL(context)
                            ? "اهلا بك في "
                            : "Welcome In ",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),
                      ),
                      Text(
                        CheckLocal.isDirectionRTL(context)
                            ? "4GO"
                            : "4GO",
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16.sp,color: Theme.of(context).colorScheme.primary,fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    CheckLocal.isDirectionRTL(context)
                        ? "من فضلك ادخل بياناتك لإنشاء حساب جديد"
                        : "Enter Your Data To Create New Account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.sp,color: Colors.white,fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
