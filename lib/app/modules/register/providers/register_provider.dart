import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../register_model.dart';

class RegisterProvider extends GetConnect {
  RegisterProvider() {
    onInit();
  }

  @override
  void onInit() {
    httpClient.baseUrl = dotenv.get('BASE_URL');
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Register.fromJson(map);
      if (map is List) {
        return map.map((item) => Register.fromJson(item)).toList();
      }
    };
  }

  Future<Register?> getRegister(int id) async {
    final response = await get('/register/$id');
    return response.body;
  }

  Future<Register?> postRegister(Register register) async {
    final Response response = await post('/register', register.toJson());
    return response.body;
  }

  Future<Response> deleteRegister(int id) async => await delete('register/$id');
}
