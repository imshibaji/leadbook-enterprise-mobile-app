import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page_dashboard'.tr),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'HomeView is working',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/login');
                },
                child: Text('Goto Login.'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/leads');
                },
                child: Text('Goto Leads.'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.changeThemeMode(ThemeMode.light);
                },
                child: Text('Light'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.changeThemeMode(ThemeMode.dark);
                },
                child: Text('Dark'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text('Value: ${controller.sname} ${controller.count}')),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.auth.logout();
                  if (!controller.auth.check()) {
                    Get.offAllNamed('/login');
                  }
                },
                child: Text('button_logout'.tr),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('en', 'EN'));
                },
                child: Text('English'),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.updateLocale(Locale('bn', 'BN'));
                },
                child: Text('বাংলা'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
