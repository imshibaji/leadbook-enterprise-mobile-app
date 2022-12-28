import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/leads_controller.dart';
import '../lead_model.dart';
import 'partials/lead_list.dart';
import 'partials/single_lead.dart';

class LeadsView extends GetView<LeadsController> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LeadsView'),
        centerTitle: true,
      ),
      body: PageView(
        controller: _controller,
        children: [
          listView(),
          singleView(),
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

  Obx listView() {
    return Obx(() => controller.leads.isEmpty
        ? Center(
            child: Text('Loading...'),
          )
        : LeadList(
            controller: controller,
            pageController: _controller,
          ));
  }

  Obx singleView() {
    return Obx(() {
      Lead lead = controller.lead.value;
      return SingleLead(controller: _controller, lead: lead);
    });
  }

  Obx othersView() {
    return Obx(
      () => Column(
        children: [
          Text(
            'LeadsView is working',
            style: TextStyle(fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Value: ${controller.count}'),
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
    );
  }
}
