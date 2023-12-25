import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesStates.dart';
import 'package:taoel_driver_app/shared/shared_commponents/commponents.dart';
import 'package:taoel_driver_app/view/widgets/success_makeOrder.dart';

import '../../../../core/helpers/helper_fun.dart';
import '../../../widgets/statusBar.dart';
class BookDetailsScreen extends StatefulWidget {
  String ? itemName;
  String ? quantity;
  String ? price;
   BookDetailsScreen({super.key,required this.price,required this.quantity,required this.itemName,});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}
List<String> options = ['68 شارع فيصل - المريوطية','68 شارع فيصل - الأسكندريه','المريوطية'];
class _BookDetailsScreenState extends State<BookDetailsScreen> {
  String currentOption = options[0];
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<HomeCubit>(context);
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if(state is ShowCartSuccess){
          navigateAndFinish(context, const SuccessMakeOrder());
        }
        if(state is ShowCartError){
          HelperFunctions.showFlashBar(
              context: context,
              title: 'خطأ',
              message: state.error,
              color: Color(0xffF6A9A9),
              titlcolor: Color(0xffD62E2E),
              icon: Icons.warning_amber,
              iconColor: Color(0xffD62E2E)
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("تفاصيل الطلب"),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: size.width*0.03),
              child: Column(
                children: [
                  SizedBox(height: size.height*0.02,),
                  ///----------First Section
                  Container(
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        border: Border.all(
                          color: Colors.black,
                        )
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('تفاصيل الطلب',style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,

                          ),),
                          SizedBox(height: size.height*0.015,),
                          Row(
                            children: [
                              Text(widget.itemName.toString(),style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400
                              ),),
                              const Spacer(),
                              Text("${widget.price}x${cubit.counter}",style: TextStyle(
                                fontWeight:FontWeight.w400,
                                fontSize: 14.sp,
                                color: const Color(0XFF748BA0),
                              ),),
                              // Text(cubit.showVendorModel!.data!.),
                            ],
                          ),
                          Row(
                            children: [
                              Text('تخفيض',style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400
                              ),),
                              const Spacer(),
                              Text("-00.00",style: TextStyle(
                                fontWeight:FontWeight.w400,
                                fontSize: 14.sp,
                                color: const Color(0XFF748BA0),
                              ),),
                              // Text(cubit.showVendorModel!.data!.),
                            ],
                          ),
                          Row(
                            children: [
                              Text('توصيل',style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400
                              ),),
                              const Spacer(),
                              Text("6.88",style: TextStyle(
                                fontWeight:FontWeight.w400,
                                fontSize: 14.sp,
                                color: const Color(0XFF748BA0),
                              ),),
                              // Text(cubit.showVendorModel!.data!.),
                            ],
                          ),
                          Row(
                            children: [
                              Text('الأجمالي',style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400
                              ),),
                              const Spacer(),
                              Text((int.parse(widget.price!)*cubit.counter+6.88).toString(),style: TextStyle(
                                fontWeight:FontWeight.w400,
                                fontSize: 14.sp,
                                color: const Color(0XFF748BA0),
                              ),),
                              // Text(cubit.showVendorModel!.data!.),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  ///----------Second Section
                  ///
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.02),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(
                            color: Colors.black,
                          )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(vertical: size.height*0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('عنوان التوصيل',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,

                            ),),
                            SizedBox(height: size.height*0.015,),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width:size.width/1,
                                    child: RadioListTile(
                                      title: const  Text('68 شارع فيصل - المريوطية'),
                                      value: options[0],
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                        });
                                      },),
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width:size.width/1,
                                    child: RadioListTile(
                                      title: const  Text('68 شارع فيصل - المريوطية'),
                                      value: options[1],
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                        });
                                      },),
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  // onTap: () {
                                  //   navigateTo(context, widget)
                                  // },
                                  child: Text('اضافة عنوان جديد',style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ),
                                // Text(cubit.showVendorModel!.data!.),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.03,),
                  ///---------- SectionThree
                  ///
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.02),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(
                            color: Colors.black,
                          )
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size.width*0.03,vertical: size.height*0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('طرق الدفع ',style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16.sp,

                            ),),
                            SizedBox(height: size.height*0.015,),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width:size.width/1,
                                    child: RadioListTile(
                                      title: const  Text('بطاقات الخصم / الائتمان'),
                                      value: options[0],
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                        });
                                      },),
                                  ),
                                ),

                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    width:size.width/1,
                                    child: RadioListTile(
                                      title: const  Text('الدفع كاش'),
                                      value: options[1],
                                      groupValue: currentOption,
                                      onChanged: (value) {
                                        setState(() {
                                          currentOption = value.toString();
                                        });
                                      },),
                                  ),
                                ),

                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height*0.05,),
                  Container(
                      width: size.width,
                      height: 51.h,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xff065BFF), Color(0xff161EEE)], // Define your gradient colors
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(8.0), // Adjust the border radius as needed
                      ),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  // side: BorderSide(color: Colors.red)
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent)
                          ),
                          onPressed: () {
                            cubit.showOrderCart('1', '0', 'notes', 'cod',widget.price!*cubit.counter);
                          },
                          child: state is ShowCartLoading?const Center(child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.white,
                          )):Text('تنفيذ الطلب',style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp
                          ),))),
                  SizedBox(height: size.height*0.1,),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
