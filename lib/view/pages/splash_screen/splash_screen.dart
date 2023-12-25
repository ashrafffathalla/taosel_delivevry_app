import 'package:flutter/material.dart';
import 'package:taoel_driver_app/view/pages/auth/autth_view.dart';
import 'package:taoel_driver_app/view/pages/home/layout.dart';
import '../../../core/localization/check_local.dart';
import '../../../core/size_config/size_config.dart';
import '../../../data/local/hiva_helper.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin{
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;


  late Widget startWidget;

  @override
  void initState() {
    String? token = HiveHelper().getData("token");

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();

    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => startWidget),
            ));
    // Future.delayed(
    //     const Duration(seconds:3),
    //     () => Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(builder: (context) =>const AuthView()),
    //         ));
    if (token != null) {
      startWidget = const LayoutScreen();
    } else {
      startWidget = const AuthView();
    }
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        // backgroundColor: const Color(0xff00B0B9),
        body: Container(
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              colors: [Color(0xff8b10b787), Color(0XFF76AAF800)], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.08),
              child: AnimatedBuilder(
                animation: _opacityAnimation,
                builder: (context, child) {
                  return Opacity(opacity: _opacityAnimation.value,
                  child: Image.asset(
                    "assets/images/splash.png",
                    gaplessPlayback: true,
                  ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
