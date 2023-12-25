import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
          child: Column(
            mainAxisAlignment:MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height*0.08,),
              Text('ارفع مستنداتك لمراجعه حسابك',style: TextStyle(fontSize:16.sp,fontWeight: FontWeight.w600),),
              SizedBox(height: size.height*0.02,),
              Text('ارفع مستنداتك لمراجعه حسابك',style: TextStyle(fontSize:14.sp),),
              SizedBox(height: size.height*0.07,),
              buildList('الصورة الشخصية ', 'assets/images/up.jpg'),
              buildList('رخصة القيادة ', 'assets/images/up.jpg'),
              buildList('رخصة المركبه  ', 'assets/images/up.jpg'),
              buildList('صورة المركبه  ', 'assets/images/up.jpg'),

            ],
          ),
        ),
      ),
    );
  }
  Widget buildList(String title,String image)=>Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(
          fontSize: 16.sp
        ),),
        Image.asset(image),
      ],
    ),
  );
}
