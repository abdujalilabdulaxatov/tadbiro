import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/data/event_model.dart';
import 'package:tadbiro_ap/ui/widgets/suggest_alert_dialog.dart';
import 'package:tadbiro_ap/ui/widgets/event_details_item.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({
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
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(CupertinoIcons.left_chevron))),
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
              ],
            ),
          ),
          const Gap(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "kjsnfjksdfn skjfnsekjfnksejf wekejfnekjfnsejk kjnfkj",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Gap(20),
                for (int i = 0; i < 3; i++) EventDetailsItem(),
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
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    subtitle: Text("Tadbir tashkilotchisi"),
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
                GestureDetector(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Ro'yhatdan o'tish",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 24),
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors.white70,
                                            radius: 20,
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(Icons.clear)),
                                          )
                                        ],
                                      ),
                                      Gap(30),
                                      const Text(
                                        "Joylar sonini tanlang: ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                      const Gap(40),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.white70,
                                            radius: 25,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.remove)),
                                          ),
                                          const Gap(20),
                                          const Text(
                                            "0",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 26),
                                          ),
                                          const Gap(20),
                                          CircleAvatar(
                                            backgroundColor: Colors.white70,
                                            radius: 25,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(Icons.add)),
                                          ),
                                        ],
                                      ),
                                      const Gap(20),
                                      const Text(
                                        "To'lov turini tanlang:",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                      const Gap(20),
                                      for (int i = 0; i < 3; i++)
                                        GestureDetector(
                                          child: Container(
                                            height: 60,
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 20),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const ListTile(
                                              trailing:
                                                  Icon(Icons.circle_outlined),
                                              leading: SizedBox(
                                                width: 50,
                                                height: 50,
                                                child: Image(
                                                  image: AssetImage(
                                                      "asset/images/paypal.png"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              title: Text("Paypal"),
                                            ),
                                          ),
                                        ),
                                      const Gap(60),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                          showDialog(
                                              context: context,
                                              builder: (ctx) =>
                                                  SuggestAlertDialog());
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 50),
                                          child: Container(
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                              child: Text(
                                                "Keyingi",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                          border:
                              Border.all(color: Colors.yellowAccent, width: 1),
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
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
