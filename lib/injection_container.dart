import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:taoel_driver_app/provider/auth_cubit/auth_cubit.dart';
import 'package:taoel_driver_app/provider/getAllOrders/getAllOrdersCubit.dart';
import 'package:taoel_driver_app/provider/getAllVendorsCtegoriesCubit/getAllVendorsCtegoriesCubit.dart';
import 'package:taoel_driver_app/provider/notification_Cubit/notification_cubit.dart';
import 'package:taoel_driver_app/provider/profile_cubit/profile_cubit.dart';
import 'package:taoel_driver_app/provider/uploadDocument_cubit/uploadDocumentCubit.dart';
import 'package:taoel_driver_app/repositories/auth_repositories/forget_pass_repositories.dart';
import 'package:taoel_driver_app/repositories/auth_repositories/login_repositories.dart';
import 'package:taoel_driver_app/repositories/auth_repositories/sign_up_repositories.dart';
import 'package:taoel_driver_app/repositories/getAllVendorsCtegoriesRepsitories/getAllVendorsCtegoriesRepositories.dart';
import 'package:taoel_driver_app/repositories/my_orders_repositories/get_allOrder_repositories.dart';
import 'package:taoel_driver_app/repositories/notification_repositories/notification_repositories.dart';
import 'package:taoel_driver_app/repositories/profile_repositories/get_profile_repository.dart';
import 'package:taoel_driver_app/repositories/profile_repositories/update_all_fields.dart';
import 'package:taoel_driver_app/repositories/profile_repositories/update_email.dart';
import 'package:taoel_driver_app/repositories/profile_repositories/update_name.dart';
import 'package:taoel_driver_app/repositories/profile_repositories/update_password.dart';
import 'package:taoel_driver_app/repositories/profile_repositories/update_phone.dart';
import 'core/constant/apis.dart';
import 'core/localization/language_cubit.dart';
import 'data/local/hiva_helper.dart';
import 'data/remote/dio_helper.dart';
final GetIt getIt = GetIt.instance;
Future<void> init() async {
// Cubit
  getIt.registerFactory(() => LanguageCubit(getIt()));
  getIt.registerFactory(() => AuthCubit(
      loginRepositories: getIt(),
      signUpRepositories: getIt(),
      forgetPassRepositories: getIt())
  );
  getIt.registerFactory(() => HomeCubit(repositories: getIt())
  );
  getIt.registerFactory(() => ProfileCubit(
      getProfileRepository: getIt(),
      // deleteAccountRepositories: getIt(),
      updateName: getIt(),
      updateEmail: getIt(),
      updatePhone: getIt(),
      updatePassword: getIt(),
    updateAllFields: getIt(),
  ));
  getIt.registerFactory(() => AllOrdersCubit(
     repositories: getIt()
  ));  getIt.registerFactory(() => UploadDocumentCubit(
     signUpRepositories: getIt()
  ));
  getIt.registerFactory(() => NotificationCubit(
     repositories: getIt()
  ));

  getIt.registerLazySingleton(
      () => HomeRepositories(dioHelper: getIt(),));
  getIt.registerLazySingleton(
      () => LoginRepositories(dioHelper: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(
      () => SignUpRepositories(dioHelper: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(
      () => ForgetPassRepositories(dioHelper: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(
      () => GetAllOrdersRepositories(dioHelper: getIt(),));
  getIt.registerLazySingleton(
      () => GelAllNotificationRepository(dioHelper: getIt(),));
   getIt.registerLazySingleton(() => GetProfileRepository(dioHelper: getIt()));
   getIt.registerLazySingleton(() => UpdateName(dioHelper: getIt()));
  getIt.registerLazySingleton(() => UpdateEmail(dioHelper: getIt()));
  getIt.registerLazySingleton(() => UpdatePhone(dioHelper: getIt()));
  getIt.registerLazySingleton(() => UpdatePassword(dioHelper: getIt()));
  getIt.registerLazySingleton(() => UpdateAllFields(dioHelper: getIt()));
  // Data sources
  getIt.registerLazySingleton(() => HiveHelper());

  // External

  getIt.registerLazySingleton(
      () => DioHelper(dio: getIt(), hiveHelper: getIt()));
  getIt.registerLazySingleton(
    () => Dio(
      BaseOptions(
        baseUrl: AutomationApi.baseUrl,
        receiveDataWhenStatusError: true,
      ),
    ),
  );
}
