import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/data/event_model.dart';
import 'package:tadbiro_ap/ui/screens/home/event_details.dart';

class EventItem extends StatefulWidget {
  final List<EventModel> lst;
  const EventItem({super.key, required this.lst});

  @override
  State<EventItem> createState() => _EventItemState();
}

class _EventItemState extends State<EventItem> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: widget.lst.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => EventDetails()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(10),
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.yellow, width: 1)),
              child: Row(
                children: [
                  Container(
                    width: 140,
                    height: 130,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 170,
                                    child: Text(
                                      widget.lst[index].name,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16),
                                    ),
                                  ),
                                  PopupMenuButton(
                                      color: Colors.yellow,
                                      icon: const Icon(
                                        CupertinoIcons.ellipsis_vertical,
                                        color: Colors.white,
                                      ),
                                      itemBuilder: (ctx) => [
                                            const PopupMenuItem(
                                                child: SizedBox(
                                              width: 100,
                                              child: Text(
                                                "Tahrirlash",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            )),
                                            const PopupMenuItem(
                                                child: SizedBox(
                                              width: 100,
                                              child: Text(
                                                "O'chirish",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                            )),
                                          ]),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const Gap(10),
                      Text(
                        "${widget.lst[index].event_time} ${widget.lst[index].event_date}",
                        style: TextStyle(color: Colors.grey),
                      ),
                      const Gap(10),
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            "Yoshlar ijod saroyi",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
