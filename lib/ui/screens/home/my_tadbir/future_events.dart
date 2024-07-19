import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tadbiro_ap/controller/event_controller.dart';
import 'package:tadbiro_ap/data/event_model.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/widgets/event_item.dart';

class FutureEvents extends StatefulWidget {
  const FutureEvents({super.key});

  @override
  State<FutureEvents> createState() => _FutureEventsState();
}

class _FutureEventsState extends State<FutureEvents> {
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
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: EventItem(
          lst: lst,
        ));
  }
}
