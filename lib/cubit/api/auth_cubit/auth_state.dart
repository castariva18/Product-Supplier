part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final LoginModel result;
  const AuthSuccess(this.result);
  @override
  List<Object> get props => [result];
}

class AuthFailed extends AuthState {
  final String message;
  const AuthFailed(this.message);
  @override
  List<Object> get props => [message];
}
