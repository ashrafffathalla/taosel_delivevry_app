import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoel_driver_app/shared/shared_commponents/commponents.dart';
import 'package:taoel_driver_app/view/pages/home/home/trackOrder.dart';

class SuccessMakeOrder extends StatelessWidget {
  const SuccessMakeOrder({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Center(child: Image.asset('assets/images/thank.png')),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text('شكرا لك على طلبك ',
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                  )),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text('جاري اعداد طلبك الآن  ',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(
                height: size.height * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  navigateAndFinish(context,const TrackOrder());
                },
                child: Container(
                  width: size.width,
                  height: 51.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Colors.black,
                          width: 1.5) // Adjust the border radius as needed
                      ),
                  child: Center(
                    child: Text(
                      'تتبع الطلب',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
