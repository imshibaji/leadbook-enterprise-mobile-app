import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page_registration'.tr),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              SvgPicture.asset('assets/chirt.svg', height: 200),
              SizedBox(
                height: 0,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Input Full Name',
                  labelText: 'field_fullname'.tr,
                ),
                validator: (value) {
                  if (value!.isNotEmpty) {
                    controller.setName(value);
                    return null;
                  }
                  return 'Please Input Fullname';
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  hintText: 'Input Email',
                  labelText: 'field_email'.tr,
                ),
                validator: (value) {
                  if (value!.isNotEmpty) {
                    controller.setEmail(value);
                    return null;
                  }
                  return 'Please Input email';
                },
              ),
              SizedBox(
                height: 15,
              ),
              Obx(
                () => TextFormField(
                  obscureText: controller.isShow.value,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.security),
                    hintText: 'Input Password',
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
                      child: Text('button_register_n_login'.tr),
                      onPressed: () {
                        controller.setRole();
                        controller.setIsActive();
                        if (_formKey.currentState!.validate()) {
                          controller.registerAndGotoHome();
                        }
                      },
                      blockButton: true,
                      shape: GFButtonShape.pills,
                      size: GFSize.LARGE,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
