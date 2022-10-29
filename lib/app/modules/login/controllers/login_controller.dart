// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/auth.dart';
import '../login_model.dart';

class LoginController extends GetxController {
  RxBool isShow = true.obs;
  Rx<Login> loginModel = Login().obs;
  Auth auth = Get.find<Auth>();

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

  void setUsername(String username) {
    loginModel.update((val) {
      val!.email = username;
    });
  }

  void setPassword(String password) {
    loginModel.update((val) {
      val!.password = password;
    });
  }

  void loginAndGotoHome() async {
    // setAuth(loginModel.toString());
    await auth.authCheck(loginModel.value.email!, loginModel.value.password!);
    if (auth.check()) {
      Get.offAndToNamed('/home');
    } else {
      Get.showSnackbar(GetSnackBar(
        title: 'error_login_title'.tr,
        message: 'error_login_message'.tr,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.deepPurple.shade900,
      ));
    }
  }
}
