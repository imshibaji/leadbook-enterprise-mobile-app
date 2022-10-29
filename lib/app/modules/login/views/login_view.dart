// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(
                height: Get.height / 7,
              ),
              // Image.asset(
              // "assets/5031659.jpg",
              // width: double.infinity,
              // ),
              SvgPicture.asset(
                'assets/login.svg',
                height: 200,
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: [
                  Text(
                    'Welcome to LeadBookPro',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  Text(
                    'Grow your business exponantial',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: 'hint_username'.tr,
                  labelText: 'field_username'.tr,
                ),
                validator: (value) {
                  if (value!.isNotEmpty) {
                    controller.setUsername(value);
                    return null;
                  }
                  return 'Please Input username';
                },
              ),
              SizedBox(
                height: 8,
              ),
              Obx(
                () => TextFormField(
                  obscureText: controller.isShow.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.security),
                    hintText: 'hint_password'.tr,
                    labelText: 'field_password'.tr,
                    suffixIcon: IconButton(
                      icon: Icon(controller.isShow.value
                          ? Icons.remove_red_eye
                          : Icons.visibility_off_rounded),
                      onPressed: () {
                        controller.showHide();
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value!.isNotEmpty) {
                      controller.setPassword(value);
                      return null;
                    }
                    return 'Please Input password';
                  },
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GFButton(
                      child: Text('button_login'.tr),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          controller.loginAndGotoHome();
                        }
                      },
                      shape: GFButtonShape.pills,
                      size: GFSize.LARGE,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: GFButton(
                      color: Colors.indigo,
                      child: Text('button_register'.tr),
                      onPressed: () {
                        Get.toNamed('/register');
                      },
                      shape: GFButtonShape.pills,
                      size: GFSize.LARGE,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GFButton(
                    onPressed: () {
                      Get.toNamed('/forget');
                    },
                    text: 'button_forgot'.tr,
                    type: GFButtonType.transparent,
                    shape: GFButtonShape.pills,
                    size: GFSize.LARGE,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
