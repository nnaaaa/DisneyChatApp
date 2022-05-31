import 'package:disneymobile/APIs/dio.dart' show API;
import 'package:disneymobile/models/user.dart';

class UserAPI {
  static const baseRoute = '/user';
  static Future<dynamic> getProfile() async {
    final user = await API().getPortal().get('$baseRoute/getProfile');
    if (user.data == null) return null;
    final userJson = await UserAPI.getProfile();
    return User.fromJson(userJson);
  }
}
