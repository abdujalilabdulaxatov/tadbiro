import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/data/event_model.dart';

class CaruselEventItem extends StatefulWidget {
  final List<EventModel> lst;
  final int index;

  const CaruselEventItem({super.key, required this.lst, required this.index});

  @override
  State<CaruselEventItem> createState() => _CaruselEventItemState();
}

class _CaruselEventItemState extends State<CaruselEventItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      height: 250,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage("asset/images/gradient_image.webp"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Text(
                      "${widget.lst[widget.index].event_date.split("-")[2]}",
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Gap(5),
                    Text(
                      widget.lst[widget.index].event_date.split("-")[1],
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Container(
                width: 45,
                height: 45,
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.heart_fill)),
              )
            ],
          ),
          SizedBox(
            width: 300,
            child: Text(
              widget.lst[widget.index].description,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
