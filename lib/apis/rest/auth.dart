import 'package:disneymobile/apis/rest/dio.dart' show API;
import 'package:dio/dio.dart' show Response;
import 'package:disneymobile/models/User.dart';

class AuthAPI {
  static const baseRoute = '/auth';
  static Future<Response> localLogin(String email, String password) async {
    return await API().getPortal().post('$baseRoute/login',
        data: {'account': email, 'password': password});
  }

  static Future<Response> registerOAuth(UserRegisterDto user) async {
    return await API()
        .getPortal()
        .post('$baseRoute/register-oauth', data: user.toJson());
  }

  static Future<Response> register(UserRegisterDto user) async {
    return await API()
        .getPortal()
        .post('$baseRoute/register', data: user.toJson());
  }

  static Future<Response> verify(String email, String digit) async {
    return await API().getPortal().put('$baseRoute/verify',
        data: {'account': email, 'digitCode': digit});
  }

  static Future<Response> refreshToken(String refreshToken) async {
    return await API()
        .getPortal()
        .post('$baseRoute/refreshToken', data: {'refreshToken': refreshToken});
  }
}

class UserRegisterDto {
  final String name;
  final String account;
  final String password;
  String? avatarUrl;

  UserRegisterDto(
      {required this.name,
      required this.account,
      required this.password,
      this.avatarUrl});

  toJson() {
    final Map<String, String> object = {
      'name': name,
      'account': account,
      'password': password,
    };

    if (avatarUrl != null) {
      object['avatarUrl'] = avatarUrl as String;
    }

    return object;
  }
}
