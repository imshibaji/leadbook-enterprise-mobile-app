import 'package:flutter/material.dart';

import '../../controllers/leads_controller.dart';
import '../../lead_model.dart';

class LeadList extends StatelessWidget {
  const LeadList({
    Key? key,
    required this.controller,
    required PageController pageController,
  })  : _controller = pageController,
        super(key: key);

  final LeadsController controller;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.leads.length,
      itemBuilder: (context, index) {
        Lead lead = controller.leads[index];
        return ListTile(
          leading: Icon(
            Icons.ads_click_sharp,
            size: 36,
          ),
          title: Text(lead.purpose!),
          subtitle: Text('Client: ${lead.name!}'),
          onTap: () {
            _controller.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.linear,
            );
            controller.setLead(lead.id!);
          },
        );
      },
    );
  }
}
