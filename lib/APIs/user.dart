import 'package:disneymobile/APIs/dio.dart' show API;

class UserAPI {
  static const baseRoute = '/user';
  static dynamic getProfile() async {
    final res = await API().getPortal().get('$baseRoute/getProfile');
    return res.data;
  }
}
