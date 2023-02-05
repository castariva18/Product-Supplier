part of 'product_cubit.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductUpdateLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final int result;
  const ProductSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class ProductFailed extends ProductState {
  final String message;
  const ProductFailed(this.message);
  @override
  List<Object> get props => [message];
}

class ProductGetSuccess extends ProductState {
  final List<ProductModel> result;
  const ProductGetSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class ProductGetFailed extends ProductState {
  final String message;
  const ProductGetFailed(this.message);
  @override
  List<Object> get props => [message];
}

class ProductUpdateSuccess extends ProductState {
  final int success;
  ProductUpdateSuccess(this.success);
  @override
  List<Object> get props => [success];
}

class ProductUpdatetFailed extends ProductState {
  final String message;
  ProductUpdatetFailed(this.message);
  @override
  List<Object> get props => [message];
}

class ProductGetDetailSuccess extends ProductState {
  final ProductDetailModel result;
  ProductGetDetailSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class ProductGetDetailFailed extends ProductState {
  final String message;
  ProductGetDetailFailed(this.message);
  @override
  List<Object> get props => [message];
}

class ProductDeleteSuccess extends ProductState {
  final String result;
  ProductDeleteSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class ProductDeleteFailed extends ProductState {
  final String message;
  ProductDeleteFailed(this.message);
  @override
  List<Object> get props => [message];
}
