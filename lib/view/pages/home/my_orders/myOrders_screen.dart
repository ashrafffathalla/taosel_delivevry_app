import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taoel_driver_app/provider/getAllOrders/getAllOrdersState.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../provider/getAllOrders/getAllOrdersCubit.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;
    var cubit = BlocProvider.of<AllOrdersCubit>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'طلباتي',
      )),
      body: BlocConsumer<AllOrdersCubit, AllOrdersState>(
        listener: (context, state) {
          if (state is GetAllOrdersLoading) {
            const CircularProgressIndicator.adaptive();
          }
        },
        builder: (context, state) {
          return state is GetAllOrdersLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.sp)),
                              child: Padding(
                                padding: EdgeInsets.all(20.0.sp),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat('dd-MM-yyyy hh:mm a')
                                              .format(DateTime.parse(cubit
                                                  .getAllOrdersModel!
                                                  .data!
                                                  .orders![index]
                                                  .orderDate
                                                  .toString()))
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "${cubit.getAllOrdersModel!.data!.orders![index].total}ج.م",
                                          style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'رقم الطلب : ${cubit.getAllOrdersModel!.data!.orders![index].orderNumber.toString()}',
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Container(
                                          width: 73.w,
                                          height: 21.h,
                                          decoration: BoxDecoration(
                                              color: cubit
                                                          .getAllOrdersModel!
                                                          .data!
                                                          .orders![index]
                                                          .orderStatus ==
                                                      'pending'
                                                  ? const Color(0XFFFFA462)
                                                  : cubit
                                                              .getAllOrdersModel!
                                                              .data!
                                                              .orders![index]
                                                              .orderStatus ==
                                                          'done'
                                                      ? Colors.green
                                                      : Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(6.sp)),
                                          child: Center(
                                            child: Text(
                                              cubit.getAllOrdersModel!.data!
                                                  .orders![index].orderStatus
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),

                                    ///---------------Divider
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('كريب'.toString(),
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600)),
                                        Text(cubit.getAllOrdersModel!.data!
                                            .orders![index].total
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('كوبون '.toString(),
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600)),
                                        Text(cubit.getAllOrdersModel!.data!
                                            .orders![index].discount
                                            .toString()),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('اجمالي الطلب '.toString(),
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600)),
                                        Text(cubit.getAllOrdersModel!.data!
                                            .orders![index].total
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 7.h,
                            );
                          },
                          itemCount:
                              cubit.getAllOrdersModel!.data!.orders!.length),
                    ),
                    SizedBox(
                      height: size.height * 0.08,
                    )
                  ],
                );
        },
      ),
    );
  }
}
