import 'package:bloc/bloc.dart';
import 'package:taoel_driver_app/data/model/notification_model.dart';
import 'package:taoel_driver_app/provider/notification_Cubit/notification_state.dart';
import '../../repositories/notification_repositories/notification_repositories.dart';
class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(
      {required this.repositories})
      : super(GetNotificationInitial());
  final GelAllNotificationRepository repositories;


  NotificationModel? notificationModel;
  getAllNotification() async {
    emit(GetNotificationLoadingState());
    try {
      notificationModel = await repositories.getAllNotification();
      emit(GetNotificationSuccessState(/*allCategoryVendorsModel: allCategoryVendors!*/));
    } catch (e) {
      emit(GetNotificationErrorState(error: e.toString()));
    }
  }

}
