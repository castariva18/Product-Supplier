part of 'supplier_cubit.dart';

abstract class SupplierState extends Equatable {
  const SupplierState();

  @override
  List<Object> get props => [];
}

class SupplierInitial extends SupplierState {}

class SupplierLoading extends SupplierState {}

class SupplierUpdateLoading extends SupplierState {}

class SupplierSuccess extends SupplierState {
  final int result;
  const SupplierSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class SupplierFailed extends SupplierState {
  final String message;
  const SupplierFailed(this.message);
  @override
  List<Object> get props => [message];
}

class SupplierGetSuccess extends SupplierState {
  final List<SupplierModel> result;
  const SupplierGetSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class SupplierGetFailed extends SupplierState {
  final String message;
  const SupplierGetFailed(this.message);
  @override
  List<Object> get props => [message];
}

class SupplierUpdateSuccess extends SupplierState {
  final int success;
  SupplierUpdateSuccess(this.success);
  @override
  List<Object> get props => [success];
}

class SupplierUpdatetFailed extends SupplierState {
  final String message;
  SupplierUpdatetFailed(this.message);
  @override
  List<Object> get props => [message];
}

class SupplierGetDetailSuccess extends SupplierState {
  final SupplierDetailModel result;
  SupplierGetDetailSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class SupplierGetDetailFailed extends SupplierState {
  final String message;
  SupplierGetDetailFailed(this.message);
  @override
  List<Object> get props => [message];
}

class SupplierDeleteSuccess extends SupplierState {
  final String result;
  SupplierDeleteSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class SupplierDeleteFailed extends SupplierState {
  final String message;
  SupplierDeleteFailed(this.message);
  @override
  List<Object> get props => [message];
}
