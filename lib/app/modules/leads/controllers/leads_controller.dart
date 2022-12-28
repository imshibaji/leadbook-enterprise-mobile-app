import 'package:get/get.dart';

import '../lead_model.dart';
import '../providers/lead_provider.dart';

class LeadsController extends GetxController {
  final count = 0.obs;
  final leadData = Get.put(LeadProvider());
  List<Lead> leads = RxList<Lead>();
  Rx<Lead> lead = Lead().obs;

  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
    if (leads.isEmpty) {
      loadDatas();
    }
  }

  @override
  void onClose() {}

  void loadDatas() async {
    if (leads.isEmpty) {
      var data = await leadData.findAll();
      leads.addAll(data!);
    }
  }

  void setLead(int id) {
    lead.value =
        leads.firstWhere((element) => (element.id != null && element.id == id));
  }

  void increment() => count.value++;
  void decrement() => count.value--;
}
