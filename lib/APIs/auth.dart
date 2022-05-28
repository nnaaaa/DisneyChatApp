
import 'package:disneymobile/APIs/dio.dart' show API;
import 'package:dio/dio.dart' show Response;
import 'package:shared_preferences/shared_preferences.dart' show SharedPreferences;

class Token {
  static getAccessToken() async {
    final session = await SharedPreferences.getInstance();
    return session.getString('accessToken');
  }

  static setAccessToken(String token) async {
    final session = await SharedPreferences.getInstance();
    await session.setString('accessToken', token);
  }

  static getRefreshToken() async {
    final session = await SharedPreferences.getInstance();
    return session.getString('refreshToken');
  }

  static setRefreshToken(String token) async {
    final session = await SharedPreferences.getInstance();
    await session.setString('refreshToken', token);
  }

  static removeToken() async {
    final session = await SharedPreferences.getInstance();
    await session.clear();
  }
}

class AuthAPI {
  static const baseRoute = '/auth';
  static Future<Response> localLogin(String email, String password) async {
    return await API().getPortal().post('$baseRoute/login',
        data: {'account': email, 'password': password});
  }

  static Future<Response> refreshToken(String refreshToken) async {
    return await API()
        .getPortal()
        .post('$baseRoute/refreshToken', data: {'refreshToken': refreshToken});
  }
}
