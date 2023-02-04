import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  void lRegisterGlobal(
      String profileName, String username, String password) async {
    try {
      emit(RegisterLoading());
      RegisterModel result =
          await RegisterServices.authRegister(profileName, username, password);
      emit(RegisterSuccess(result));
    } catch (e) {
      emit(RegisterFailed(e.toString()));
    }
  }

  void logoutGlobal() {
    RegisterServices.signOut();
  }
}
