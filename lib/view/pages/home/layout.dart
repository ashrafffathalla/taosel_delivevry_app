
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:taoel_driver_app/view/pages/home/favorite/favorite_screen.dart';
import 'package:taoel_driver_app/view/pages/home/home/home_screen.dart';
import 'package:taoel_driver_app/view/pages/home/my_orders/myOrders_screen.dart';
import 'package:taoel_driver_app/view/pages/home/notification/notification_screen.dart';
import 'package:taoel_driver_app/view/pages/home/search/search_screen.dart.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {

  int _page = 0;
  List<Widget> _buildScreens() =>const[
    HomeScreen(),
    MyOrdersScreen(),
    NotificationScreen(),
  ];
  late PersistentTabController _controller;
  @override
  void initState() {

    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalizations.of(context);
    return [
      PersistentBottomNavBarItem(
        icon: FittedBox(
          fit: BoxFit.none,
          clipBehavior: Clip.none,
          child:  Padding(
            padding:  EdgeInsets.only( top: size.height * 0.018,),
            child:const Icon(Icons.home_outlined,size: 25,),
          ),
        ),
        title: "الرئيسيه",
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 8.sp, fontWeight: FontWeight.bold),
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
      ///-----orders----------
      PersistentBottomNavBarItem(
        icon: FittedBox(
          fit: BoxFit.none,
          clipBehavior: Clip.none,
          child: Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.014,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.sp),
              child: SvgPicture.asset(
                height:size.height*0.027,
                'assets/images/orders.svg',
                color: _page == 1 ?  Theme.of(context).colorScheme.onPrimary : Colors.grey,
              ),
            ),
          ),
        ),
        title: locale!.myBooking,
        textStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 8.sp, fontWeight: FontWeight.bold),
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Colors.grey,
      ),

      PersistentBottomNavBarItem(
        icon: FittedBox(
            fit: BoxFit.none, child: GestureDetector(
          child: Padding(
            padding:  EdgeInsets.only( top: size.height * 0.018,),
            child:const Icon(Icons.notifications_active_outlined,size: 25,),
          ),
        )),
        textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 8.sp, fontWeight: FontWeight.bold),
        title: "الأشعارات",
        activeColorPrimary: Theme.of(context).colorScheme.onPrimary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: PersistentTabView(
        context,
        onItemSelected: (index) => setState(() => _page = index),
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Theme.of(context).brightness==Brightness.light?Colors.white:Color(0xff222249),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        //navBarHeight: Platform.isIOS?MediaQuery.of(context).size.height * 0.060:MediaQuery.of(context).size.height * 0.080,
        hideNavigationBarWhenKeyboardShows: true,
        //margin: Platform.isIOS ? EdgeInsets.all(0) : EdgeInsets.all(20.0),
        padding: const NavBarPadding.only(top: 0),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 0.0,
        selectedTabScreenContext: (context) {},
        hideNavigationBar: false,
        decoration:const NavBarDecoration(),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties:const ItemAnimationProperties(
          duration: Duration(milliseconds: 100),
          // curve: Curves.fastOutSlowIn,
        ),
        screenTransitionAnimation:const ScreenTransitionAnimation(
          animateTabTransition: true,
          // curve: Curves.linear,
          duration: Duration(milliseconds: 100),
        ),
        navBarStyle: NavBarStyle.style8,
      ),
    );
  }


}
