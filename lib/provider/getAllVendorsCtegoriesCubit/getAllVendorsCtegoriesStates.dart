import 'package:equatable/equatable.dart';
import 'package:taoel_driver_app/data/model/allCategoryCategories.dart';
import 'package:taoel_driver_app/data/model/showVendor_model.dart';

import '../../data/model/allVendors_model.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}
class GetAllVendorsCategoriesInitial extends HomeState {}

class GetAllCategoryVendorsLoading extends HomeState {}

class GetAllCategoryVendorsLoaded extends HomeState {
  // final AllCategoryVendorsModel allCategoryVendorsModel;
  // const GetAllCategoryVendorsLoaded({required this.allCategoryVendorsModel});
  // @override
  // List<Object> get props => [allCategoryVendorsModel];
}
class GetAllCategoryVendorsError extends HomeState {
  final String error;
  const GetAllCategoryVendorsError({required this.error});
  @override
  List<Object> get props => [error];
}
///AllVendors States
class GetAllVendorCategoryLoading extends HomeState {}

class GetAllVendorCategoryLoaded extends HomeState {
  // final AllVendorsModel allVendorsModel;
  // const GetAllVendorsLoaded({required this.allVendorsModel});
  // @override
  // List<Object> get props => [allVendorsModel];
}
class GetAllVendorCategoryError extends HomeState {
  final String error;
  const GetAllVendorCategoryError({required this.error});
  @override
  List<Object> get props => [error];
}
///AllVendors States
class GetAllVendorsLoading extends HomeState {}

class GetAllVendorsLoaded extends HomeState {
  // final AllVendorsModel allVendorsModel;
  // const GetAllVendorsLoaded({required this.allVendorsModel});
  // @override
  // List<Object> get props => [allVendorsModel];
}
class GetAllVendorsError extends HomeState {
  final String error;
  const GetAllVendorsError({required this.error});
  @override
  List<Object> get props => [error];
}
///----------show Vendor
class ShowVendorLoading extends HomeState {}

class ShowVendorLoaded extends HomeState {
  // final AllVendorsModel allVendorsModel;
  // const GetAllVendorsLoaded({required this.allVendorsModel});
  // @override
  // List<Object> get props => [allVendorsModel];
}
class ShowVendorError extends HomeState {
  final String error;
  const ShowVendorError({required this.error});
  @override
  List<Object> get props => [error];
}

///----------Addition Counter------------
class CounterLoading extends HomeState {}
class CounterLoaded extends HomeState {}
///--------
class CheckAdditionSelectedLoading extends HomeState {}
class AdditionsIsLoading extends HomeState {}
class AdditionsLoading extends HomeState {}
class AdditionsSuccess extends HomeState {
  final List<Addition?>? additions;
  const AdditionsSuccess(this.additions);
  @override
  List<Object> get props => [additions ?? []];
}
class AdditionError extends HomeState {
  final String error;
  const AdditionError({required this.error});
  @override
  List<Object> get props => [error];
}
///---------
class ShowCartLoading extends HomeState {}

class ShowCartSuccess extends HomeState {}
class ShowCartError extends HomeState {
  final String error;
  const ShowCartError({required this.error});
  @override
  List<Object> get props => [error];
}
///-----
class CancelLoading extends HomeState {}

class CancelSuccess extends HomeState {}

class CancelError extends HomeState {
  final String error;
  CancelError({required this.error});
  @override
  List<Object> get props => [error];
}
class AddAddressLoading extends HomeState {}

class AddAddressSuccess extends HomeState {}

class AddAddressError extends HomeState {
  final String error;
  AddAddressError({required this.error});
  @override
  List<Object> get props => [error];
}
class DeleteOrderLoading extends HomeState {}

class DeleteOrderSuccess extends HomeState {}

class DeleteOrderError extends HomeState {
  final String error;
  DeleteOrderError({required this.error});
  @override
  List<Object> get props => [error];
}