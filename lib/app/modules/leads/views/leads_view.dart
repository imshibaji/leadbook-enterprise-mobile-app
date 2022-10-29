import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/leads_controller.dart';

class LeadsView extends GetView<LeadsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LeadsView'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'LeadsView is working',
            style: TextStyle(fontSize: 20),
          ),
          Obx(
            (() => Text(
                'Lead Purpose: ${controller.leads.value.purpose ?? 'No Data'}')),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text('Value: ${controller.count}'),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    controller.increment();
                  },
                  child: Text('Increment'))
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
