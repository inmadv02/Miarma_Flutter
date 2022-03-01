import 'package:miarma_app_flutter/src/models/register/registerDTO.dart';
import 'package:miarma_app_flutter/src/models/register/register_response.dart';

abstract class RegisterRepository {
  Future<RegisterResponse> register(RegisterDTO registerDTO, String path);
}
