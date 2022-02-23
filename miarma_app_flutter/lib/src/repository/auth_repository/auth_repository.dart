import 'package:miarma_app_flutter/src/models/auth/loginDTO.dart';
import 'package:miarma_app_flutter/src/models/auth/login_response.dart';

abstract class AuthRepository {
  Future<LoginResponse> login(LoginDto loginDto);
}
