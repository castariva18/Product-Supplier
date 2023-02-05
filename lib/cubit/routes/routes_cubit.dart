import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'routes_state.dart';

class RoutesCubit extends Cubit<RoutesState> {
  RoutesCubit() : super(RoutesSplashScreenPage());
  Stream<RoutesState> mapEventToState(RoutesState state) async* {
    if (state is RoutesSplashScreenPage) {
      emit(RoutesSplashScreenPage());
    } else if (state is RoutesLoginPage) {
      emit(RoutesLoginPage());
    } else if (state is RoutesRegisterPage) {
      emit(RoutesRegisterPage());
    } else if (state is RoutesMainPage) {
      final int pageNumber = 0;
      emit(RoutesMainPage(pageNumber));
    } else if (state is RoutesDashboardPage) {
      emit(RoutesDashboardPage());
    } else if (state is RoutesAddProductPage) {
      emit(RoutesAddProductPage());
    } else if (state is RoutesAddSuplierPage) {
      emit(RoutesAddSuplierPage());
    } else if (state is RoutesUpdateSupplier) {
      final int id = 0;
      emit(RoutesUpdateSupplier(id));
    } else if (state is RoutesUpdateBarang) {
      final int id = 0;
      emit(RoutesUpdateBarang(id));
    }
  }
}
