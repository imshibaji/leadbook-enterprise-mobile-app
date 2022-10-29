import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../auth_model.dart';
import '../login_model.dart';

class LoginProvider extends GetConnect {
  LoginProvider() {
    onInit();
  }

  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Auth.fromJson(map);
      if (map is List) return map.map((item) => Auth.fromJson(item)).toList();
    };
    httpClient.baseUrl = dotenv.get('BASE_URL');
  }

  Future<Auth?> getLogin(Login login) async {
    final response = await get(
        '/auth/login?email=${login.email}&password=${login.password}');
    return response.body;
  }

  Future<Auth?> postLogin(Login login) async {
    final response = await post('/login', login.toJson());
    return response.body;
  }
}
