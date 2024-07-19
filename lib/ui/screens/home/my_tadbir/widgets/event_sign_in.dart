import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/ui/widgets/suggest_alert_dialog.dart';

class EventSignIn extends StatefulWidget {
  const EventSignIn({super.key});

  @override
  State<EventSignIn> createState() => _EventSignInState();
}

class _EventSignInState extends State<EventSignIn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Colors.yellow,
            context: context,
            builder: (ctx) {
              return SizedBox(
                height: 750,
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Ro'yhatdan o'tish",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 20,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      color: Colors.black,
                                    )),
                              )
                            ],
                          ),
                          Gap(30),
                          const Text(
                            "Joylar sonini tanlang: ",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const Gap(40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    )),
                              ),
                              const Gap(20),
                              const Text(
                                "0",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 26,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(20),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 25,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    )),
                              ),
                            ],
                          ),
                          const Gap(20),
                          const Text(
                            "To'lov turini tanlang:",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          const Gap(20),
                          for (int i = 0; i < 3; i++)
                            GestureDetector(
                              child: Container(
                                height: 60,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: const ListTile(
                                  trailing: Icon(Icons.circle_outlined),
                                  leading: SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Image(
                                      image:
                                          AssetImage("asset/images/paypal.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Text(
                                    "Paypal",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          const Gap(60),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                              showDialog(
                                  context: context,
                                  builder: (ctx) => SuggestAlertDialog());
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Center(
                                  child: Text(
                                    "Keyingi",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.yellowAccent, width: 1),
              borderRadius: BorderRadius.circular(5)),
          child: const Center(
            child: Text(
              "Ro'yhatdan o'tish",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
