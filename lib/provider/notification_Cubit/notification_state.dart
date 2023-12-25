import 'package:equatable/equatable.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
  @override
  List<Object> get props => [];
}
class GetNotificationInitial extends NotificationState {}
class GetNotificationLoadingState extends NotificationState {}
class GetNotificationSuccessState extends NotificationState {}
class GetNotificationErrorState extends NotificationState {
  final String error;
  const GetNotificationErrorState({required this.error});
  @override
  List<Object> get props => [error];

}