import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/data/event_model.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/widgets/event_sign_in.dart';
import 'package:tadbiro_ap/ui/widgets/suggest_alert_dialog.dart';
import 'package:tadbiro_ap/ui/widgets/event_details_item.dart';

class EventDetails extends StatefulWidget {
  EventModel eventModel;
  EventDetails(
    this.eventModel, {
    super.key,
  });

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: 400,
            height: 250,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("asset/images/gradient_image.webp"),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 45,
                        height: 45,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              CupertinoIcons.left_chevron,
                              color: Colors.black,
                            ))),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: const BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Gap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.eventModel.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                for (int i = 0; i < 3; i++)
                  EventDetailsItem(index: i, widget.eventModel),
                const Gap(20),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const ListTile(
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundImage:
                          AssetImage("asset/images/tadbiro_logo.png"),
                    ),
                    title: Text(
                      "Alisher Zokirov",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                    subtitle: Text(
                      "Tadbir tashkilotchisi",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const Gap(60),
                const Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,",
                  style: TextStyle(color: Colors.white),
                ),
                const Gap(100),
                const Text(
                  "Yoshlar ijodiy saroyi",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Text(
                  "Mustaqillik ko'chasi Toshkent",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const Gap(20),
                Container(
                  height: 350,
                  width: double.infinity,
                  color: Colors.amber,
                ),
                const Gap(40),
                EventSignIn()
              ],
            ),
          ),
        ],
      )),
    );
  }
}
