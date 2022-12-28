import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadbook_online/app/modules/register/providers/register_provider.dart';

import '../../../data/auth.dart';
import '../register_model.dart';
// import '../register_model_back.dart';

class RegisterController extends GetxController {
  RxBool isShow = true.obs;
  Rx<Register> registerModel = Register().obs;
  Auth auth = Get.find<Auth>();
  late RegisterProvider registerProvider = RegisterProvider();

  final count = 0.obs;

  @override
  void onClose() {}

  void showHide() => isShow.toggle();

  void setAuth(String data) {
    auth.set(data);
  }

  void setName(String name) {
    registerModel.update((val) {
      val!.name = name;
    });
  }

  void setEmail(String email) {
    registerModel.update((val) {
      val!.email = email;
    });
  }

  void setPassword(String password) {
    registerModel.update((val) {
      val!.password = password;
    });
  }

  void setIsActive([bool isActive = true]) {
    registerModel.update((val) {
      val!.isActive = isActive;
    });
  }

  void setRole([String role = 'user']) {
    registerModel.update((val) {
      val!.role = role;
    });
  }

  void registerAndGotoHome() async {
    await registerProvider.postRegister(registerModel.value);
    // setAuth(loginModel.toString());
    await auth.authCheck(
        registerModel.value.email!, registerModel.value.password!);
    if (auth.check()) {
      Get.offAndToNamed('/home');
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'Login Error'.tr,
        message: 'Username and password do not matched.'.tr,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.deepPurple.shade900,
      ));
    }
  }
}
