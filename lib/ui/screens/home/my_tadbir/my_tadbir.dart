import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/add_event.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/future_events.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/my_event_false.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/my_event_true.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/my_events.dart';
import 'package:tadbiro_ap/ui/screens/home/notification_page.dart';
import 'package:tadbiro_ap/ui/widgets/tadbiro_drawer.dart';

class MyTadbir extends StatefulWidget {
  const MyTadbir({super.key});

  @override
  State<MyTadbir> createState() => _MyTadbirState();
}

class _MyTadbirState extends State<MyTadbir> {
  TabController? _tabController;

  List<String> tabbar_list = [
    "Tashkil qilganlarim",
    "Yaqinda",
    "Ishtirok etganlarim",
    "Bekor qilganlarim",
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => const AddEvent()));
          },
          child: const CircleAvatar(
            backgroundColor: Colors.yellow,
            radius: 30,
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
        drawer: const TadbiroDrawer(),
        backgroundColor: Colors.black,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const NotificationPage()));
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
            "Mening tadbirlarim",
            style: TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
              unselectedLabelColor: Colors.white,
              labelColor: Colors.yellow,
              indicatorColor: const Color.fromARGB(255, 218, 207, 106),
              controller: _tabController,
              isScrollable: true,
              tabs: [
                for (int i = 0; i < tabbar_list.length; i++)
                  Text(
                    tabbar_list[i],
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
              ]),
        ),
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: TabBarView(children: [
              const MyEvents(),
              FutureEvents(),
              MyEventsTrue(),
              MyEventsFalse(),
            ])),
      ),
    );
  }
}
