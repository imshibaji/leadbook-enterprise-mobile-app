import 'package:get/get.dart';
import '../providers/user_provider.dart';
import '../user_model.dart';

class UsersController extends GetxController {
  final userProvider = Get.put(UserProvider());
  final count = 0.obs;
  final users = RxList<User>();

  @override
  // ignore: unnecessary_overrides
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  @override
  void onClose() {}

  void loadData() async {
    final data = await userProvider.findAll();
    users.addAll(data);
  }

  void increment() => count.value++;
}
