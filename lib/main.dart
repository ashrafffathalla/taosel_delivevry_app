import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taoel_driver_app/core/localization/language_cubit.dart';
import 'package:taoel_driver_app/myobserver.dart';
import 'package:taoel_driver_app/provider/auth_cubit/auth_cubit.dart';
import 'package:taoel_driver_app/provider/getAllOrders/getAllOrdersCubit.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import 'package:taoel_driver_app/provider/notification_Cubit/notification_cubit.dart';
import 'package:taoel_driver_app/provider/profile_cubit/profile_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:taoel_driver_app/provider/uploadDocument_cubit/uploadDocumentCubit.dart';
import 'package:taoel_driver_app/view/pages/auth/sign_up/upload_document.dart';
import 'package:taoel_driver_app/view/pages/splash_screen/splash_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'core/constant/lang_code.dart';
import 'core/style/style.dart';
import 'data/local/hiva_helper.dart';
import 'injection_container.dart';
import 'view/pages/auth/autth_view.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  await init();
  await HiveHelper.init();
  Bloc.observer = MyObserver();
/*
  if (Platform.isIOS) {
    // await Firebase.initializeApp(
    //   name: 'abudiyab',
    //   options: const FirebaseOptions(
    //     apiKey: "AIzaSyAFKqP6AeGcJKP55yEYtSWCo1m4PWE83Zk",
    //     appId: "1:1092780024078:ios:6274a163218d2a9ba4375f",
    //     messagingSenderId: "1092780024078",
    //     projectId: "abudiyab-ab965",
    //   ),
    // );
    firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  } else {
    await Firebase.initializeApp();
    firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // await Firebase.initializeApp();
  }
  await FirebaseMessaging.instance.getToken().then((value) {
    deviceToken = value;
  });
  FirebaseMessaging.onMessage.listen((event) {});
  FirebaseMessaging.onMessageOpenedApp.listen((event) {});
*/
  ///------------- END Firebase Code -------------------
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, widget) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext context) => getIt<LanguageCubit>()),
            BlocProvider<AuthCubit>(create: (context) => getIt<AuthCubit>()),
            BlocProvider<HomeCubit>(create: (context) => getIt<HomeCubit>()),
            BlocProvider<ProfileCubit>(
                create: (context) => getIt<ProfileCubit>()),
            BlocProvider(
                create: (context) => getIt<AllOrdersCubit>()..getAllOrders()),
            BlocProvider(
                create: (context) => getIt<NotificationCubit>()..getAllNotification()),BlocProvider(
                create: (context) => getIt<UploadDocumentCubit>()),
            // BlocProvider(
            //     create: (BuildContext context) => FacebookLoginCubit()),
          ],
          child: BlocBuilder<LanguageCubit, Locale>(builder: (_, locale) {
            return MaterialApp(
              title: 'Loates for delivery',
              debugShowCheckedModeBanner: false,
              theme: lightTheme(),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              localeResolutionCallback: (deviceLocale, supportedLocale) {
                if (deviceLocale != null) {
                  for (Locale locale in supportedLocale) {
                    if (deviceLocale.languageCode == locale.languageCode) {
                      return deviceLocale;
                    }
                  }
                }
                return supportedLocale.first;
              },
              locale: locale,
              home:  UploadDocuments(),
            );
          }),
        );
      },
    );
  }
}
