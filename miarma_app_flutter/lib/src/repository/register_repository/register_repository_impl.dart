import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:miarma_app_flutter/src/models/register/registerDTO.dart';
import 'package:miarma_app_flutter/src/models/register/register_response.dart';
import 'package:miarma_app_flutter/src/repository/register_repository/register_repository.dart';

import '../constants.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  @override
  Future<RegisterResponse> register(
      RegisterDTO registerDTO, String path) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
    };

    var request = http.MultipartRequest(
        'POST', Uri.parse('${Constants.apiBaseUrl}/auth/register'));
    request.files.add(await http.MultipartFile.fromPath('image', path));
    var res = await request.send();
    var responded = await http.Response.fromStream(res);

    final response = await http.post(
        Uri.parse('${Constants.apiBaseUrl}/auth/register'),
        headers: headers,
        body: [jsonEncode(registerDTO.toJson()), responded]);
    if (response.statusCode == 201) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception('Fail to login');
    }
  }
}
