import 'package:flutter/material.dart';

import '../../lead_model.dart';

class SingleLead extends StatelessWidget {
  const SingleLead({
    Key? key,
    required PageController controller,
    required this.lead,
  })  : _controller = controller,
        super(key: key);

  final PageController _controller;
  final Lead lead;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _controller.animateToPage(
                    0,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                },
                icon: Icon(Icons.arrow_back_ios_sharp),
              ),
              Text(
                lead.purpose ?? 'No Data',
                style: TextStyle(fontSize: 20),
              ),
              Spacer(),
              Text(
                lead.status ?? 'No Data',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(color: Colors.black),
          Row(
            children: [
              Icon(Icons.account_circle_outlined),
              SizedBox(width: 5),
              Text(
                lead.name ?? 'No Data',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.email_outlined),
              SizedBox(width: 5),
              Text(lead.email ?? 'No Data'),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(Icons.phone_android),
                  SizedBox(width: 5),
                  Text(lead.mobile ?? 'No Data'),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Icon(Icons.phonelink_outlined),
                  SizedBox(width: 5),
                  Text(lead.altMobile ?? 'No Alt. Mobile'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.source_outlined),
              SizedBox(width: 5),
              Text(lead.source ?? 'No Data'),
            ],
          ),
          Divider(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
