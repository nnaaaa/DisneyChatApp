import 'package:disneymobile/APIs/dio.dart' show API;

class UserAPI {
  static const baseRoute = '/user';
  static Future<dynamic> getProfile() async {
    final user = await API().getPortal().get('$baseRoute/getProfile');
    if (user.data == null) return null;
    return user.data;
  }
}
