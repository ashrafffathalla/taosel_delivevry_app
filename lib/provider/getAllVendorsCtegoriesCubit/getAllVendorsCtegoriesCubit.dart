import 'package:flutter/material.dart';
import 'package:taoel_driver_app/data/model/allCategoryCategories.dart';
import 'package:taoel_driver_app/data/model/allVendors_model.dart';
import 'package:taoel_driver_app/provider/auth_cubit/auth_state.dart';
import 'package:bloc/bloc.dart';
import '../../data/model/allVendorCategoryModel.dart';
import '../../data/model/cart_order_store_model.dart';
import '../../data/model/showVendor_model.dart';
import '../../repositories/getAllVendorsCtegoriesRepsitories/getAllVendorsCtegoriesRepositories.dart';
import 'getAllVendorsCtegoriesStates.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
      {required this.repositories})
      : super(GetAllVendorsCategoriesInitial());
  final HomeRepositories repositories;


//allVendorsCategories
  AllCategoryVendorsModel? allCategoryVendors;
  getAllCategoryVendorsFun() async {
    emit(GetAllCategoryVendorsLoading());
    try {
       allCategoryVendors = await repositories.getAllVendorsCategoriesRepositories();
      emit(GetAllCategoryVendorsLoaded(/*allCategoryVendorsModel: allCategoryVendors!*/));
    } catch (e) {

      emit(GetAllCategoryVendorsError(error: e.toString()));
    }
  }
  ///------------Get All Cat Vendors
  AllVendorCategoryModel? allVendorCategoryModel;
  getAllVendorCategory(id) async {

    emit(GetAllVendorCategoryLoading());
    try {

      allVendorCategoryModel = await repositories.allVendorCategoryRepositories(id);
      emit(GetAllVendorCategoryLoaded(/*allVendorsModel: allVendorsModel*/));
    } catch (e) {
      emit(GetAllVendorCategoryError(error: e.toString()));
    }
  }
///------------Get All Vendors
   AllVendorsModel? allVendorsModel;
  getAllVendors() async {
    emit(GetAllVendorsLoading());
    try {
       allVendorsModel = await repositories.allVendorsRepositories();
      emit(GetAllVendorsLoaded(/*allVendorsModel: allVendorsModel*/));
    } catch (e) {
      emit(GetAllVendorsError(error: e.toString()));
    }
  }

  ///------------ShowVendor----------------
  ShowVendorModel? showVendorModel;
  showVendor(id) async {
    emit(ShowVendorLoading());
    try {
      showVendorModel = await repositories.showVendorRepositories(id);
      emit(ShowVendorLoaded(/*allVendorsModel: allVendorsModel*/));
    } catch (e) {
      emit(ShowVendorError(error: e.toString()));
    }
  }


  ///----------Addition Fun
  ///
  List<int> additions = [];
  List<Addition?>? features;

  // add addition to the list of additions
  addAdditionToCart(BuildContext context, String productId,String quantity)async{
    emit(AdditionsLoading());
    try{
      await repositories.addAddition(product_id: productId, quantity: quantity, additions: additions);
      emit(AdditionsSuccess(features));
    }catch(e){
      emit(AdditionError(error: e.toString()));
    }
  }
  addAddition(BuildContext context, Addition? addition,String quantity)async{
    emit(AdditionsIsLoading());
    additions.add(int.parse(addition!.id.toString()));
    // await repositories.addAddition(product_id: addition.id.toString(), quantity: quantity, additions: additions);
    // emit(AdditionsSuccess(features));
  }
  // // remove addition from the list of additions
  // removeAddition(BuildContext context, Feature? feature) {
  //   additions.remove(int.parse(feature!.id.toString()));
  //   final daysPrice = double.parse(feature.daily!
  //       ? BlocProvider.of<BookingCubit>(context).days!.toString()
  //       : "1");
  //   total = total - (double.parse(feature.price.toString()) * daysPrice);
  //   emit(AdditionsLoading());
  //   emit(AdditionsSuccess(features));
  // }

  CartOrderStoreModel? cartOrderStoreModel;
  showOrderCart(String addressId,String discount,String notes,String paymentMethod,dynamic total)async {
    emit(ShowCartLoading());
  try{
    cartOrderStoreModel = await repositories.showOrderCart(addressId: addressId,
        discount: discount,
        notes: notes,
        paymentMethod: paymentMethod,
        total: total);
    emit(ShowCartSuccess());
  }catch(e){
    emit(ShowCartError(error: e.toString()));
  }

  }
  ///--------------cancel
  Future<void> cancelBooking({required int orderId}) async {
    emit(CancelLoading());
    try {
      await repositories.cancelBooking(orderId: orderId);
      emit(CancelSuccess());
    } catch (e) {
      emit(CancelError(error: e.toString()));
    }
  }
  Future<void> addNewAddress({required String address,required double lat,required double lon,}) async {
    emit(AddAddressLoading());
    try {
      await repositories.addNewAddress(address: address, lat: lat, lon: lon);
      emit(AddAddressSuccess());
    } catch (e) {
      emit(AddAddressError(error: e.toString()));
    }
  }
  ///delete
  // Future<void> deleteBooking({required int orderId}) async {
  //   emit(DeleteOrderLoading());
  //   try {
  //     await cancelBookingDataSources.deleteBooking();
  //     emit(DeleteOrderSuccess());
  //   } catch (e) {
  //     emit(DeleteOrderError(error: e.toString()));
  //   }
  // }
  int counter = 1;
  incrementCounter() {
    emit(CounterLoading());
     counter++;
    emit(CounterLoaded());
  }

  decrementCounter() {
    emit(CounterLoading());
    counter--;
    emit(CounterLoaded());
  }
}
