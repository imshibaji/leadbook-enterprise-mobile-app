import 'package:get/get.dart';
import '../../../data/auth.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  String? sname;
  Auth auth = Get.find<Auth>();

  @override
  void onInit() {
    super.onInit();
    sname = 'Base Name';
  }

  @override
  void onReady() {
    super.onReady();
    sname = 'OnReady Name';
    print("Auth Key: ${auth.key}"); // Check Auth Key

    if (!auth.check()) {
      Get.offAndToNamed('/login');
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
