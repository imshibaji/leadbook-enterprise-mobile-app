import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controllers/forget_controller.dart';

class ForgetView extends GetView<ForgetController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page_forgot'.tr),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            SizedBox(
              height: 100,
            ),
            SvgPicture.asset('assets/forgot_password.svg', height: 200),
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                hintText: 'Input Email',
                labelText: 'field_email'.tr,
              ),
              validator: (value) {
                if (value!.isNotEmpty) {
                  return null;
                }
                return 'Please Input Email';
              },
            ),
            SizedBox(
              height: 8,
            ),
            GFButton(
              onPressed: () {},
              text: 'button_send_email'.tr,
              fullWidthButton: true,
              shape: GFButtonShape.pills,
              size: GFSize.LARGE,
            )
          ],
        ),
      ),
    );
  }
}
