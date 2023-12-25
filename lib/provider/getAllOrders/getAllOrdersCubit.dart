
import 'package:bloc/bloc.dart';
import 'package:taoel_driver_app/provider/getAllOrders/getAllOrdersState.dart';
import 'package:taoel_driver_app/repositories/my_orders_repositories/get_allOrder_repositories.dart';

import '../../data/model/getAllOrdersModel.dart';

class AllOrdersCubit extends Cubit<AllOrdersState> {
  AllOrdersCubit({required this.repositories})
      : super(GetAllOrdersInitial());
  final GetAllOrdersRepositories repositories;

  ///----------Get All Orders -----------------
  GetAllOrdersModel? getAllOrdersModel;
  getAllOrders() async {
    emit(GetAllOrdersLoading());
    try {
      getAllOrdersModel = await repositories.getAlOrders();
      emit(GetAllOrdersLoaded());
    } catch (e) {
      emit(GetAllOrdersError(error: e.toString()));
    }
  }

}
