import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import '../lead_model.dart';

class LeadProvider extends GetConnect {
  LeadProvider() {
    onInit();
  }

  @override
  void onInit() {
    print('Provider is loaded');
    httpClient.baseUrl = dotenv.get('BASE_URL');
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Lead.fromJson(map);
      if (map is List) {
        return map.map((item) => Lead.fromJson(item)).toList();
      }
    };
  }

  Future<List<Lead>>? findAll() async {
    final response = await get('/leads');
    // List map = response.body;
    // List<LeadModel> leads =
    // map.map((item) => LeadModel.fromJson(item)).toList();
    // return leads;
    return response.body;
  }

  Future<Lead?> findOne(int id) async {
    final response = await get('/leads/$id');
    // LeadModel lead = LeadModel.fromJson(response.body);
    // return lead;
    return response.body;
  }

  Future<Response<Lead>> create(Lead lead) async => await post('/leads', lead);

  Future<Response> remove(int id) async => await delete('/leads/$id');
}
