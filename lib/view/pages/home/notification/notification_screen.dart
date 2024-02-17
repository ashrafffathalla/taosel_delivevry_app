import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoel_driver_app/provider/notification_Cubit/notification_cubit.dart';
import 'package:taoel_driver_app/provider/notification_Cubit/notification_state.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<NotificationCubit>(context);
    return BlocConsumer<NotificationCubit, NotificationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("الأشعارات"),
          ),
          body:state is GetNotificationLoadingState?const Center(child: CircularProgressIndicator.adaptive()): SingleChildScrollView(
            child: Column(
              children: [
                cubit.notificationModel==null||state is GetNotificationErrorState?Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height/3,
                      ),
                      Icon(Icons.notifications_off_outlined,size: 50.sp,),
                      Text(
                        'لا توجد اشعارات حاليا',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ):SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.notifications_active_sharp,size: 40.sp,),
                              Column(
                                children: [
                                  Text(cubit.notificationModel!.data![index].dataView!.title.toString(),style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                  Text(cubit.notificationModel!.data![index].dataView!.message.toString(),style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0XFF748BA0)
                                  ),),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                       return SizedBox(
                          height: 56.h,
                        );
                      },
                      itemCount: 5),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
