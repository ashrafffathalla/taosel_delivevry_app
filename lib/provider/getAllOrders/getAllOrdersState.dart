import 'package:equatable/equatable.dart';
import 'package:taoel_driver_app/data/model/getAllOrdersModel.dart';

abstract class AllOrdersState extends Equatable {
  const AllOrdersState();
  @override
  List<Object> get props => [];
}
class GetAllOrdersInitial extends AllOrdersState {}

class GetAllOrdersLoading extends AllOrdersState {}

class GetAllOrdersLoaded extends AllOrdersState {}
class GetAllOrdersError extends AllOrdersState {
  final String error;
  const GetAllOrdersError({required this.error});
  @override
  List<Object> get props => [error];
}