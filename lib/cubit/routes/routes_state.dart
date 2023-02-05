part of 'routes_cubit.dart';

abstract class RoutesState extends Equatable {
  const RoutesState();

  @override
  List<Object> get props => [];
}

class RoutesInitial extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesSplashScreenPage extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesLoginPage extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesRegisterPage extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesDashboardPage extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesMainPage extends RoutesState {
  final int pageNumber;
  RoutesMainPage(this.pageNumber);
  @override
  List<Object> get props => [pageNumber];
}

class RoutesAddProductPage extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesAddSuplierPage extends RoutesState {
  @override
  List<Object> get props => [];
}

class RoutesUpdateSupplier extends RoutesState {
  final int id;
  RoutesUpdateSupplier(this.id);
  @override
  List<Object> get props => [id];
}

class RoutesUpdateBarang extends RoutesState {
  final int id;
  RoutesUpdateBarang(this.id);
  @override
  List<Object> get props => [id];
}
