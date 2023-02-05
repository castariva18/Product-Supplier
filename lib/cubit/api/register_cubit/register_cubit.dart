import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../models/models.dart';
import '../../../services/services.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  void registerGlobal(
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
}
