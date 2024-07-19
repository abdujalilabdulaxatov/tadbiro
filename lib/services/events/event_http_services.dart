import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tadbiro_ap/data/event_model.dart';
import 'package:tadbiro_ap/ui/screens/home/my_tadbir/add_event.dart';

class EventHttpServices extends ChangeNotifier {
  List<Map<String, dynamic>> lst = [];

  Future<void> addEvent(EventModel event) async {
    Uri url = Uri.parse(
        "https://tadbiro-2eeb6-default-rtdb.firebaseio.com/events.json");
    var response = await http.post(url,
        body: jsonEncode({
          "event_id": event.event_id,
          "event_user_id": event.event_user_id,
          "description": event.description,
          "name": event.name,
          "event_time": event.event_time,
          "event_day": event.event_date,
          "event_location": event.event_location,
        }));
    notifyListeners();
  }

  Future<List<EventModel>> getAllEvents() async {
    List<EventModel> lst = [];
    Uri url = Uri.parse(
        "https://tadbiro-2eeb6-default-rtdb.firebaseio.com/events.json");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      data.forEach(
        (key, value) {
          lst.add(EventModel(
              event_id: key,
              event_user_id: value["event_user_id"],
              description: value["description"],
              name: value["name"],
              event_time: value["event_time"],
              event_date: value["event_day"],
              event_location: ""));
        },
      );
    }
    print("$lst htpp");
    return lst;
  }

  Future<List<EventModel>> getMyEvents(String localId) async {
    List<EventModel> lst = [];
    Uri url = Uri.parse(
        "https://tadbiro-2eeb6-default-rtdb.firebaseio.com/events.json");
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      data.forEach(
        (key, value) {
          if (value["event_user_id"] == localId) {
            print("http");
            lst.add(EventModel(
                event_id: key,
                event_user_id: value["event_user_id"],
                description: value["description"],
                name: value["name"],
                event_time: value["event_time"],
                event_date: value["event_day"],
                event_location: ""));
            print("$lst htpp");
          }
        },
      );
    }
    print(" http");
    return lst;
  }
}
