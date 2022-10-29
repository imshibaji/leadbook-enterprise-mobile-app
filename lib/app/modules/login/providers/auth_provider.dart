import 'package:get/get.dart';

import '../auth_model.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Auth.fromJson(map);
      if (map is List) return map.map((item) => Auth.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Auth?> getAuth(int id) async {
    final response = await get('auth/$id');
    return response.body;
  }

  Future<Response<Auth>> postAuth(Auth auth) async => await post('auth', auth);
  Future<Response> deleteAuth(int id) async => await delete('auth/$id');
}
