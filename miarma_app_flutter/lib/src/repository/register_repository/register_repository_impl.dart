import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:miarma_app_flutter/src/models/register/registerDTO.dart';
import 'package:miarma_app_flutter/src/models/register/register_response.dart';
import 'package:miarma_app_flutter/src/repository/register_repository/register_repository.dart';
import 'package:miarma_app_flutter/utils/shared_preferences.dart';

import '../constants.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  @override
  Future<RegisterResponse> register(
      RegisterDTO registerDTO, String path) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    final uri = Uri.parse('${Constants.apiBaseUrl}/auth/register');

    final body = jsonEncode({
      'nickname': registerDTO.nickname,
      'avatar': "",
      'fullname': registerDTO.fullname,
      'email': registerDTO.email,
      'password': registerDTO.password,
      'password2': registerDTO.password2,
      'visibilidad': registerDTO.visibilidad,
      'fechaNacimiento': registerDTO.fechaNacimiento.toString().split(' ')[0]
    });

    PreferenceUtils.setString('avatar', path);

    final body2 = jsonEncode({
      "nickname": "inma_dv",
      "avatar": "",
      "fullname": "M.ª Inmaculada Domínguez Vargas",
      "fechaNacimiento": "2002-05-25",
      "email": "inma.dvgs@gmail.com",
      "password": "12334",
      "password2": "12334",
      "visibilidad": "PUBLIC"
    });

    final request = http.MultipartRequest('POST', uri)
      ..files.add(http.MultipartFile.fromString('nuevoUsuario', body,
          contentType: MediaType('application', 'json')))
      ..files.add(await http.MultipartFile.fromPath('file', path,
          contentType: MediaType('image', 'jpg')))
      ..headers.addAll(headers);

    final res = await request.send();

    final responded = await http.Response.fromStream(res);

    if (res.statusCode == 200) {
      return RegisterResponse.fromJson(json.decode(responded.body));
    } else {
      throw Exception('Fail to login');
    }
  }
}
