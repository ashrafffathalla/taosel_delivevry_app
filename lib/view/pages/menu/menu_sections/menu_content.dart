import 'package:taoel_driver_app/core/localization/check_local.dart';
import 'package:taoel_driver_app/data/local/hiva_helper.dart';
import 'package:taoel_driver_app/view/pages/auth/autth_view.dart';
import 'package:taoel_driver_app/view/pages/menu/about_us/how_app_works/how_app_works.dart';
import 'package:taoel_driver_app/view/pages/menu/about_us/our_services/our_services.dart';
import 'package:taoel_driver_app/view/pages/menu/about_us/privacy_policy/privacy_policy.dart';
import 'package:taoel_driver_app/view/pages/menu/support/contact_us/contact_us.dart';
import 'package:taoel_driver_app/view/pages/menu/support/faq/faq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/localization/language_cubit.dart';
import '../../../../core/size_config/size_config.dart';
import '../../../../provider/auth_cubit/auth_cubit.dart';
import '../my_account/account_info/account_Informations.dart';

class BuildMenuItem extends StatefulWidget {
  const BuildMenuItem({Key? key}) : super(key: key);

  @override
  State<BuildMenuItem> createState() => _BuildMenuItemState();
}

class _BuildMenuItemState extends State<BuildMenuItem> {
  bool lang = false;
  bool accountCollapsed = false;
  bool bookingCollapsed = false;
  bool aboutCollapsed = false;
  bool supportCollapsed = false;
  bool settingsCollapsed = false;
  @override
  void initState() {
    // BlocProvider.of<OrdersCubit>(context).getRecieveAndDeliverOrdersData(state: 'Pending');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    return Container(
      padding: EdgeInsets.only(top: SizeConfig.defaultSize! * 1),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpansionTile(
              collapsedBackgroundColor: Colors.grey.withOpacity(0.2),
              backgroundColor: Colors.white38,
              collapsedIconColor: Colors.white,
              onExpansionChanged: (trailing) {
                setState(() {
                  accountCollapsed = trailing;
                });
              },
              title: ListTile(
                horizontalTitleGap: 0,
                leading:  Icon(Icons.person,color: Colors.white,size: 25.sp,),
                title: Text(
                  local!.myAccount,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
                onTap: null,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 0,
                        leading:  Icon(Icons.info_outline,color: Colors.white,size: 20.sp,),
                        title: Text(
                          local.accountInfo,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AccountInformation()),
                          );
                        },
                      ),

                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              collapsedBackgroundColor: Colors.grey.withOpacity(0.2),
              backgroundColor: Colors.white38,
              collapsedIconColor: Colors.white,
              onExpansionChanged: (trailing) {
                setState(() {
                  bookingCollapsed = trailing;
                });
              },
              title: ListTile(
                horizontalTitleGap: 0,
                leading:  Icon(Icons.calendar_month,color: Colors.white,size: 25.sp,),
                title: Text(
                  local.myBooking,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
                onTap: null,
              ),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 0,
                        leading: SvgPicture.asset(
                          "assets/images/myOrdersIcon.svg",
                          width: 18,
                        ),
                        title: Text(
                          local.myOrders,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => MyOrders(isLastScreen: false,)));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              collapsedBackgroundColor: Colors.grey.withOpacity(0.2),
              backgroundColor: Colors.white38,
              collapsedIconColor: Colors.white,
              onExpansionChanged: (trailing) {
                setState(() {
                  aboutCollapsed = trailing;
                });
              },
              title: ListTile(
                horizontalTitleGap: 0,
                leading:  Icon(Icons.local_offer_outlined,color: Colors.white,size: 25.sp,),
                title: Text(
                  CheckLocal.isDirectionRTL(context)?"العروض":"Offers",
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),

                onTap: null,
              ),
            ),
            ExpansionTile(
              collapsedBackgroundColor: Colors.grey.withOpacity(0.2),
              backgroundColor: Colors.white38,
              collapsedIconColor: Colors.white,
              onExpansionChanged: (trailing) {
                setState(() {
                  supportCollapsed = trailing;
                });
              },
              title: ListTile(
                horizontalTitleGap: 0,
                leading:  Icon(Icons.support_agent,color: Colors.white,size: 25.sp,),
                title: Text(
                  local.support,
                  style: TextStyle(color: Colors.white, fontSize: 15.sp),
                ),
                onTap: null,
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      ListTile(
                        horizontalTitleGap: 0,
                        leading:  Icon(Icons.help,color: Colors.white,size: 18.sp,),
                        title: Text(
                          local.contactUs,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const ContactUs()));
                        },
                      ),
                      ListTile(
                        horizontalTitleGap: 0,
                        leading: SvgPicture.asset(
                          "assets/images/faq.svg",
                          width: 18,
                        ),
                        title: Text(
                          local.faq,
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.sp),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FAQ()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
             Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding:  EdgeInsets.only(right: 25.sp),
              child: Text(
              CheckLocal.isDirectionRTL(context)?"الأشعارات":"Notifications",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Switch(
                activeTrackColor:Colors.blue,
                activeColor: Colors.white,
                value: lang,
                onChanged: (value) {
                  setState(() {
                    lang = value;
                    // BlocProvider.of<LanguageCubit>(context).selectEngLanguage();
                    // BlocProvider.of<RentCarCubit>(context).regionModel.clear();
                    //
                    // BlocProvider.of<LanguageCubit>(context).selectEngLanguage();
                    // BlocProvider.of<RentCarCubit>(context).regionModel.clear();
                    // //BlocProvider.of<RentCarCubit>(context).getRegion();
                    // BlocProvider.of<AuthCubit>(context).listCountry.clear();
                    // BlocProvider.of<AuthCubit>(context).getCountry();
                  });
                },
              ),
            ),
          ],
        ), GestureDetector(
                    onTap: () {
                      HiveHelper().removeData("token").then((value) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const AuthView()),
                            (route) => false);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                right: 25.sp, top: 20.sp, left: 20.sp),
                            child: Text(
                              local.logout,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          IconButton(onPressed: (){}, icon: const Icon(Icons.logout,size: 22,color: Colors.red,)),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
