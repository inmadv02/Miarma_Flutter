import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miarma_app_flutter/src/blocs/login/bloc/login_bloc.dart';
import 'package:miarma_app_flutter/src/models/register/registerDTO.dart';
import 'package:miarma_app_flutter/src/models/register/register_response.dart';
import 'package:miarma_app_flutter/src/repository/register_repository/register_repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository registerRepository;

  RegisterBloc(this.registerRepository) : super(RegisterInitial()) {
    on<DoRegisterEvent>(_doRegisterEvent);
  }

  void _doRegisterEvent(
      DoRegisterEvent event, Emitter<RegisterState> emit) async {
    try {
      final registerResponse =
          await registerRepository.register(event.registerDTO, event.path);
      emit(RegisterSuccessState(registerResponse));
      return;
    } on Exception catch (e) {
      emit(RegisterErrorState(e.toString()));
    }
  }
}
