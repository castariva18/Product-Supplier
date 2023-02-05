import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';

part 'supplier_state.dart';

class SupplierCubit extends Cubit<SupplierState> {
  SupplierCubit() : super(SupplierInitial());
  void getSupplierData() async {
    try {
      emit(SupplierLoading());
      var duration = const Duration(milliseconds: 1500);
      Timer(duration, () async {
        List<SupplierModel> result = await SupplierServices.getAllSupplier();
        emit(SupplierGetSuccess(result));
      });
    } catch (e) {
      emit(SupplierGetFailed(e.toString()));
    }
  }

  void getDetailSupplier(int id) async {
    try {
      emit(SupplierLoading());
      var duration = Duration(milliseconds: 1000);
      Timer(duration, () async {
        SupplierDetailModel result =
            await SupplierServices.getDetailSupplier(id);
        emit(SupplierGetDetailSuccess(result));
      });
    } catch (e) {
      emit(SupplierGetDetailFailed(e.toString()));
    }
  }

  void addSupplier(
    String alamat,
    String namaSupplier,
    String notelp,
  ) async {
    try {
      emit(SupplierLoading());
      var duration = const Duration(milliseconds: 1500);
      Timer(duration, () async {
        int result = await SupplierServices.addSupplier(
          alamat,
          namaSupplier,
          notelp,
        );
        emit(SupplierSuccess(result));
      });
    } catch (e) {
      emit(SupplierFailed(e.toString()));
    }
  }

  void updateSupplier(
      String alamat, int id, String namaSupplier, String noTelp) async {
    try {
      emit(SupplierUpdateLoading());
      var duration = Duration(milliseconds: 1500);
      Timer(duration, () async {
        int result = await SupplierServices.updateSupplier(
          alamat,
          id,
          namaSupplier,
          noTelp,
        );
        emit(SupplierUpdateSuccess(result));
      });
    } catch (e) {
      emit(SupplierUpdatetFailed(e.toString()));
    }
  }

  void deleteSupplierCubit(int id) async {
    try {
      emit(SupplierLoading());
      var duration = Duration(milliseconds: 2000);
      Timer(duration, () async {
        String result = await SupplierServices.deleteSupplier(id);
        emit(SupplierDeleteSuccess(result));
      });
    } catch (e) {
      emit(SupplierDeleteFailed(e.toString()));
    }
  }
}
