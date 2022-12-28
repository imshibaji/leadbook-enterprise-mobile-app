import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:leadbook_online/app/modules/users/user_model.dart';

import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UsersView'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _controller,
        children: [
          listView(),
          Obx(
            () => Center(
              child: Text(
                'UsersView is working: ${controller.count.value}',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }

  Obx listView() {
    return Obx(
      () => controller.users.isEmpty
          ? Center(
              child: Text('Loading...'),
            )
          : ListView.builder(
              itemCount: controller.users.length,
              itemBuilder: (context, index) {
                User user = controller.users[index];
                return ListTile(
                  leading: Icon(
                    Icons.business_sharp,
                    size: 36,
                  ),
                  title: Text(user.name!),
                  subtitle: user.businesses!.isNotEmpty
                      ? Text(user.businesses!.first.name!)
                      : Text('No Business Added'),
                );
              }),
    );
  }
}
