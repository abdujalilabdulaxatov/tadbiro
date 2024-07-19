import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/data/event_model.dart';

class EventDetailsItem extends StatefulWidget {
  final int index;
  EventModel eventModel;
  EventDetailsItem(
    this.eventModel, {
    super.key,
    required this.index,
  });

  @override
  State<EventDetailsItem> createState() => _EventDetailsItemState();
}

class _EventDetailsItemState extends State<EventDetailsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      // color: Colors.amber,
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                color: Colors.teal, borderRadius: BorderRadius.circular(15)),
            child: const Center(
              child: Icon(
                Icons.calendar_month,
                size: 50,
              ),
            ),
          ),
          const Gap(10),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "14-iyul, 2024",
                style: TextStyle(
                    color: Colors.tealAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Gap(10),
              Text(
                "Yakshanba, 4:00PM - 9:00PM",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              )
            ],
          )
        ],
      ),
    );
  }
}
