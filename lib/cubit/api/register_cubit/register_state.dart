part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final RegisterModel result;
  const RegisterSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class RegisterFailed extends RegisterState {
  final String message;
  const RegisterFailed(this.message);
  @override
  List<Object> get props => [message];
}
