import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/controller/event_controller.dart';
import 'package:tadbiro_ap/data/event_model.dart';
import 'package:tadbiro_ap/ui/screens/home/event_details.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/widgets/event_item.dart';
import 'package:tadbiro_ap/ui/screens/home/notification_page.dart';
import 'package:tadbiro_ap/ui/widgets/carusel_event_item.dart';
import 'package:tadbiro_ap/ui/widgets/tadbiro_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventModel> lst = [];

  String localId = "";
  final eventController = EventController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocalId();
  }

  Future<void> getLocalId() async {
    final pref = await SharedPreferences.getInstance();
    localId = pref.getString("localId")!;
    lst = await eventController.getAllEvents();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: const TadbiroDrawer(),
          backgroundColor: Colors.black,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => NotificationPage()));
                  },
                  icon: const Icon(
                    CupertinoIcons.bell,
                    size: 30,
                    color: Colors.white,
                  ))
            ],
            // leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            backgroundColor: Colors.black,
            title: const Text(
              "Bosh sahifa",
            ),
          ),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.white,
                      )),
                  suffixIcon: const Icon(
                    CupertinoIcons.line_horizontal_3_decrease,
                    color: Colors.white,
                  ),
                  hintText: "Tadbirlarni izlash...",
                  hintStyle: const TextStyle(color: Colors.white),
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Yaqin 7 kun ichida",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
            ),
            const Gap(5),
            SizedBox(
              height: 250,
              child: PageView(
                children: [
                  for (int i = 0; i < lst.length; i++)
                    CaruselEventItem(
                      index: i,
                      lst: lst,
                    )
                ],
              ),
            ),
            const Gap(10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Barcha tadbirlar",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const Gap(10),
            Expanded(child: EventItem(lst: lst)),
          ]),
        ));
  }
}
