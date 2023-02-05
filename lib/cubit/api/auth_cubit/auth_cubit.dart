import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  void loginGlobal(String username, String password) async {
    try {
      emit(AuthLoading());
      LoginModel result = await AuthServices.authLogin(username, password);
      emit(AuthSuccess(result));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void logoutGlobal() {
    AuthServices.signOut();
  }
}
