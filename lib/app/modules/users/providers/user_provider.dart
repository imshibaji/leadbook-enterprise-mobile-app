import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../../../data/auth.dart';
import '../user_model.dart';

class UserProvider extends GetConnect {
  Auth auth = Auth();
  String? token;

  UserProvider() {
    onInit();
  }

  @override
  void onInit() {
    httpClient.baseUrl = dotenv.get('BASE_URL');

    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return User.fromJson(map);
      if (map is List) return map.map((item) => User.fromJson(item)).toList();
    };
    httpClient.addAuthenticator<dynamic>((request) async {
      await auth.init();
      token = auth.key;
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });
  }

  Future<List<User>> findAll() async {
    final response = await get('/users');
    return response.body;
  }

  Future<User?> getUser(int id) async {
    final response = await get('/users/$id');
    return response.body;
  }

  Future<Response<User>> postUser(User user) async =>
      await post('/users', user);

  Future<Response> deleteUser(int id) async => await delete('/users/$id');
}
