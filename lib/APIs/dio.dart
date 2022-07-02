import 'package:dio/dio.dart' show Dio, BaseOptions, InterceptorsWrapper;
import 'package:disneymobile/apis/auth.dart' show AuthAPI;
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class API {
  final BaseOptions options = BaseOptions(baseUrl: dotenv.env['SERVER_HOST']);
  late final Dio _dio;

  API() {
    _dio = Dio(options);
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (options) async {
      // attach accessToken for each request
      final accessToken = await Token.getAccessToken();
      options.headers["Authorization"] = 'Bearer $accessToken';
    }, onResponse: (options) async {
      // save accessToken to cookie
      if (options.headers['accessToken'] != null &&
          options.headers['accessToken'][0] != null) {
        await Token.setAccessToken(options.headers['accessToken'][0]);
      }

      // save refreshToken to cookie
      if (options.headers['refreshToken'] != null &&
          options.headers['refreshToken'][0] != null) {
        await Token.setRefreshToken(options.headers['refreshToken'][0]);
      }
    }, onError: (error) async {
      // token expired
      if (error.response?.statusCode == 401) {
        //get refreshToken from cookie
        final refreshToken = await Token.getRefreshToken();

        //get accessToken by send refreshToken to server
        final res = await AuthAPI.refreshToken(refreshToken);
        if (res.headers['accessToken'] != null &&
            res.headers['accessToken'][0] != null) {
          await Token.setAccessToken(res.headers['accessToken'][0]);

          //send the previous request again
          return _dio.request<dynamic>(error.request.path,
              data: error.request.data,
              queryParameters: error.request.queryParameters,
              options: error.request);
        } else {
          //refreshToken expired
          Token.removeToken();
        }
      }
    }));
  }

  Dio getPortal() {
    return _dio;
  }
}


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

