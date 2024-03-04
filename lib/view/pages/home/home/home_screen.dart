import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/data/local/hiva_helper.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesStates.dart';
import 'package:taoel_driver_app/provider/profile_cubit/profile_cubit.dart';
import 'package:taoel_driver_app/view/pages/auth/autth_view.dart';
import 'package:taoel_driver_app/view/pages/home/home/showVendorScreen.dart';
import 'package:taoel_driver_app/view/pages/home/my_orders/myOrders_screen.dart';
import 'package:taoel_driver_app/view/pages/menu/my_account/account_info/account_info.dart';

import '../../../../shared/shared_commponents/commponents.dart';
import '../../auth/account information/accountinfo.dart';
import '../../menu/menu.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  IconData? deIcon;
  bool isHide = false;
  int selectedIndex = 0;

  @override
  void initState() {
    BlocProvider.of<ProfileCubit>(context).getProfileData();
    // BlocProvider.of<HomeCubit>(context).getAllCategoryVendorsFun();
    // BlocProvider.of<GetAllVendorsCategoriesCubit>(context).getAllVendors();

    BlocProvider.of<HomeCubit>(context)
        .getAllVendorCategory(2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final Size size = MediaQuery
        .of(context)
        .size;
    var cubit = BlocProvider.of<HomeCubit>(context);
    return Scaffold(
      drawer: const Menu(),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetAllCategoryVendorsError) {
            if (state.error.contains('Unauthenticated')) {
              navigateAndFinish(
                context,
                const AuthView(),
              );
            }
          }
          // if(cubit.allCategoryVendors==null||cubit.allVendorsModel==null){
          //   const CircularProgressIndicator.adaptive();
          // }
        },
        builder: (context, state) {
          return cubit.allCategoryVendors == null ||
              cubit.allVendorCategoryModel == null
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
            child: SizedBox(
              height: size.height / 1,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Flexible(
                    child: SizedBox(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.03),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    navigateTo(context, MyOrdersScreen());
                                  },
                                  child: SvgPicture.asset(
                                      'assets/images/shop.svg'),
                                ),
                                SizedBox(
                                  width: size.width * 0.01,
                                ),
                                Container(
                                    decoration: BoxDecoration(
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .primary,
                                        borderRadius:
                                        BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 0.01.sh),
                                      child: Text(
                                        "0ج.م",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp),
                                      ),
                                    )),
                              ],
                            ),
                            Text(
                              CheckLocal.isDirectionRTL(context)
                                  ? "عنوان التوصيل ^"
                                  : "Delivery address ^",
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                   navigateTo(context, const AccountInformation());
                                  },
                                  child: CircleAvatar(
                                    radius: 18.sp, // Image radius
                                    backgroundImage: const NetworkImage(
                                      'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),

                  ///-------------------After AppBar--------------
                  /// -------------Search Abd Menu Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Builder(
                              builder: (context) =>
                                  IconButton(
                                    icon: Padding(
                                      padding:
                                      CheckLocal.isDirectionRTL(context)
                                          ? EdgeInsets.only(right: 1.sp)
                                          : EdgeInsets.only(left: 1.sp),
                                      child: Icon(
                                        Icons.menu,
                                        size: 37.sp,
                                      ),
                                    ),
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                  ),
                            ),
                            Expanded(
                              child: SizedBox(
                                width: size.width / 1.2,
                                height: 50.h,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText:
                                    CheckLocal.isDirectionRTL(context)
                                        ? "نفسك فى اية ......."
                                        : "What do you want ?......",
                                    border: OutlineInputBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                        style: BorderStyle.solid,
                                      ),
                                    ),
                                    suffixIcon: Container(
                                      margin: EdgeInsets.all(5.sp),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(40.h, 40.w),
                                          backgroundColor:
                                          Theme
                                              .of(context)
                                              .colorScheme
                                              .primary,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                8.0),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        /// -------------Horizontal List------------
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            cubit.allCategoryVendors!.data.length,
                            // Replace with the actual number of items
                            itemBuilder:
                                (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    // BlocProvider.of<GetAllVendorsCategoriesCubit>(context).showVendorModel =null;
                                    BlocProvider.of<
                                        HomeCubit>(context).getAllVendorCategory(index + 1);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: selectedIndex == index
                                          ? const Color(0xff0C1D2E)
                                          : Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(8.0),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0.sp),
                                    child: Text(
                                      cubit.allCategoryVendors!
                                          .data[index].name,
                                      style: TextStyle(
                                        fontSize: 14.0.sp,
                                        color: const Color(0xff0C1D2E),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Image.asset('assets/images/lay.png'),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              CheckLocal.isDirectionRTL(context)
                                  ? "الاقرب لك "
                                  : "The closest to you",
                              style: TextStyle(
                                  color: const Color(0xff0C1D2E),
                                  fontSize: 16.sp),
                            ),
                            Text(
                              CheckLocal.isDirectionRTL(context)
                                  ? "عرض الكل "
                                  : "Show All",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: const Color(0xff0C1D2E),
                                  fontSize: 16.sp),
                            ),
                          ],
                        ),
                        ///---------Grid ITEMS------------
                        SizedBox(
                            height: size.height * 0.4,
                            child: state is GetAllVendorCategoryLoading
                                ? const Center(
                                child: CircularProgressIndicator
                                    .adaptive())
                                : cubit.allVendorCategoryModel!.data!.vendors!
                                .isEmpty
                                ? Column(
                              children: [
                                SizedBox(height: size.height * 0.09,),
                                const Icon(Icons.hourglass_empty),
                                Text('لايوجد متاجر متاحه حاليا',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight:
                                      FontWeight.w600,
                                      color: const Color(
                                          0xff0C1D2E)),
                                ),
                              ],
                            )
                                : GridView.count(
                              crossAxisCount: 3, //
                              physics: const NeverScrollableScrollPhysics(),
                              children: List.generate(
                                  cubit.allVendorCategoryModel!
                                      .data!.vendors!.length
                                      .toInt(), (index) {
                                return GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<HomeCubit>(context)
                                        .showVendor(index + 1);
                                    navigateTo(
                                        context,
                                        const ShowVendorScreen());
                                  },
                                  child: Column(
                                    children: [
                                      cubit.allVendorCategoryModel!.data!.vendors![0].media!.isEmpty?Container():SizedBox(
                                          height: 0.065.sh,
                                          width: 0.06.sh,
                                          child: Image.network(cubit.allVendorCategoryModel!.data!.vendors![0].media![0].path.toString())),
                                      SizedBox(height: 5.h),
                                      Text(
                                        cubit
                                            .allVendorCategoryModel!
                                            .data!
                                            .vendors![index]
                                            .name
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight:
                                            FontWeight.w500,
                                            color: const Color(
                                                0xff0C1D2E)),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
