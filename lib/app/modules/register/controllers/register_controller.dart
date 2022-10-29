// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/auth.dart';
import '../register_model.dart';

class RegisterController extends GetxController {
  RxBool isShow = true.obs;
  Rx<RegisterModel> registerModel = RegisterModel().obs;
  Auth auth = Get.find<Auth>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void showHide() => isShow.toggle();

  void setAuth(String data) {
    auth.set(data);
  }

  void setName(String name) {
    registerModel.update((val) {
      val!.fullname = name;
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

  void registerAndGotoHome() {
    // setAuth(loginModel.toString());
    auth.authCheck(registerModel.value.email!, registerModel.value.password!);
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
