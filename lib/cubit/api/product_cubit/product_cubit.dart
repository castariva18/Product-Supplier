import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  void getProductData() async {
    try {
      emit(ProductLoading());
      var duration = const Duration(milliseconds: 1500);
      Timer(duration, () async {
        List<ProductModel> result = await ProductServices.getAllProduct();
        emit(ProductGetSuccess(result));
      });
    } catch (e) {
      emit(ProductGetFailed(e.toString()));
    }
  }

  void addProduct(
    int harga,
    int id,
    String namaBarang,
    int stok,
    String alamat,
    int idSupplier,
    String namaSupplier,
    String noTelp,
  ) async {
    try {
      emit(ProductLoading());
      var duration = const Duration(milliseconds: 1500);
      Timer(duration, () async {
        int result = await ProductServices.addProduct(
          harga,
          id,
          namaBarang,
          stok,
          alamat,
          idSupplier,
          namaSupplier,
          noTelp,
        );
        emit(ProductSuccess(result));
      });
    } catch (e) {
      emit(ProductFailed(e.toString()));
    }
  }

  void updateProduct(
      String alamat, int id, String namaSupplier, String noTelp) async {
    try {
      emit(ProductUpdateLoading());
      var duration = Duration(milliseconds: 1500);
      Timer(duration, () async {
        int result = await ProductServices.updateProduct(
          alamat,
          id,
          namaSupplier,
          noTelp,
        );
        emit(ProductUpdateSuccess(result));
      });
    } catch (e) {
      emit(ProductUpdatetFailed(e.toString()));
    }
  }

  void getDetailProduct(int id) async {
    try {
      emit(ProductLoading());
      var duration = Duration(milliseconds: 1000);
      Timer(duration, () async {
        ProductDetailModel result = await ProductServices.getDetailProduct(id);
        emit(ProductGetDetailSuccess(result));
      });
    } catch (e) {
      emit(ProductGetDetailFailed(e.toString()));
    }
  }

  void deleteProductCubit(int id) async {
    try {
      emit(ProductLoading());
      var duration = Duration(milliseconds: 2000);
      Timer(duration, () async {
        String result = await ProductServices.deleteProduct(id);
        emit(ProductDeleteSuccess(result));
      });
    } catch (e) {
      emit(ProductDeleteFailed(e.toString()));
    }
  }
}
