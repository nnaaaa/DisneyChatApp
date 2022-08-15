import 'package:disneymobile/apis/dio.dart' show API;
import 'package:disneymobile/models/User.dart';

class UserAPI {
  static const baseRoute = '/user';
  static Future<dynamic> getProfile() async {
    final user = await API().getPortal().get('$baseRoute/getProfile');
    if (user.data == null) return null;
    return User.fromJson(user.data);
  }

  static Future<dynamic> findByName(String name) async {
    final user = await API().getPortal().get('$baseRoute/$name');
    print(user);
    // if (user.data == null) return null;
    // return User.fromJson(user.data);
  }
}
