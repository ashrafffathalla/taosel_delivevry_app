import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesStates.dart';
import 'package:taoel_driver_app/shared/shared_commponents/commponents.dart';
import 'package:taoel_driver_app/view/pages/home/layout.dart';
import 'package:taoel_driver_app/view/pages/home/my_orders/myOrders_screen.dart';

import '../../../../core/helpers/helper_fun.dart';
import '../../../../provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  int currentStep = 0;

  List<Step> steps = [
    const Step(
      title: Text('تأكيد الطلب'),
      content: Text('تم تأكيد الطلب وسوف يتم تجهيزه من خلال المندب'),
      isActive: true,
    ),
    const Step(
      title: Text('اعداد الطلب'),
      content: Text('تم الانتهاء من تجهيز الطلب وجاري توصيلة'),
      isActive: true,
    ),
    const Step(
      title: Text('توصيل الطلب'),
      content: Text('جاري توصيل طلبك من خلال المندوب'),
      isActive: false,
    ),
    const Step(
      title: Text('استلام الطلب'),
      content: Text('تم استلام طلبك بنجاح '),
      isActive: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<HomeCubit>(context);
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context, state) {
        if(state is CancelSuccess){
          navigateAndFinish(context,const LayoutScreen());
          HelperFunctions.showFlashBar(
              color: Color(0xffDCEFE3),
              context: context,
              title: '',
              message: 'تم الغاء الطلب بنجاح',
              titlcolor: Color(0xff327B5B),
              icon: Icons.check,
              iconColor: Color(0xff327B5B));
        }
        if(state is CancelError){
          HelperFunctions.showFlashBar(
              context: context,
              title: 'خطأ',
              message: state.error,
              color:const Color(0xffF6A9A9),
              titlcolor:const Color(0xffD62E2E),
              icon: Icons.warning_amber,
              iconColor: const Color(0xffD62E2E));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.1,
                  ),
                  Image.asset('assets/images/trackorder.png'),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Text(
                    'الوقت المتوقع للوصول 30 دقيقة',
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.03,
                    ),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03,
                            vertical: size.height * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'طلبك : ',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0XFF748BA0)),
                                ),
                                Text(
                                  cubit.cartOrderStoreModel!.data!.order!.orderNumber.toString(),
                                  style: TextStyle(
                                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'التاريخ : ',
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: const Color(0XFF748BA0)),
                                ),
                                Text(
                                  DateFormat('dd-MM-yyyy hh:mm a').format(DateTime.parse(cubit.cartOrderStoreModel!.data!.order!.orderDate.toString())).toString(),
                                  style: TextStyle(
                                      fontSize: 14.sp, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Stepper(
                    elevation: 0,
                    physics:const NeverScrollableScrollPhysics(),
                    currentStep: currentStep,
                    steps: steps,
                    type: StepperType.vertical,
                    // onStepTapped: (step) {
                    //   setState(() {
                    //     currentStep = step;
                    //   });
                    // },

                    controlsBuilder: (context, details) {
                      return const SizedBox.shrink();
                    },
                  ),
                  // onStepContinue: () {
                  //   setState(() {
                  //     if (currentStep < steps.length - 1) {
                  //       currentStep++;
                  //     }
                  //   });
                  // },
                  // onStepCancel: () {
                  //   setState(() {
                  //     if (currentStep > 0) {
                  //       currentStep--;
                  //     }
                  //   });
                  // },
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigateTo(context,const MyOrdersScreen());
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
                          'طلباتى',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  GestureDetector(
                    onTap: () {
                      cubit.cancelBooking(orderId: cubit.cartOrderStoreModel!.data!.order!.id!.toInt());
                    },
                    child: Container(
                      width: size.width,
                      height: 51.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                              color: Colors.red,
                              width: 1.5) // Adjust the border radius as needed
                      ),
                      child: Center(
                        child:state is CancelLoading?const Center(child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.white,
                        )): Text(
                          'الغاء الطلب',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.red
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
