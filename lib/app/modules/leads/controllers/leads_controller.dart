import 'package:get/get.dart';

import '../lead_model.dart';
import '../providers/lead_provider.dart';

class LeadsController extends GetxController {
  final count = 0.obs;
  final leadData = Get.put(LeadProvider());
  final leads = Lead().obs;

  @override
  void onInit() {
    super.onInit();
    loadDatas();
  }

  @override
  void onReady() async {
    super.onReady();
    leads.refresh();
  }

  @override
  void onClose() {}

  void loadDatas() async {
    var data = await leadData.findAll();
    leads.value = data!.first;
  }

  void increment() => count.value++;
  void decrement() => count.value--;
}
