import 'package:flutter/material.dart';
import 'package:tadbiro_ap/data/event_model.dart';
import 'package:tadbiro_ap/services/events/event_http_services.dart';

class EventController extends ChangeNotifier {
  final eventHttpServices = EventHttpServices();
  List<EventModel> futureEvent = [];
  List<EventModel> falseEvent = [];
  List<EventModel> trueEvent = [];

  Future<void> addEvent(EventModel event) async {
    await eventHttpServices.addEvent(EventModel(
        event_id: event.event_id,
        event_user_id: event.event_user_id,
        description: event.description,
        name: event.name,
        event_time: event.event_time,
        event_date: event.event_date,
        event_location: event.event_location));
    notifyListeners();
  }

  Future<List<EventModel>> getMyEvents(String localId) async {
    List<EventModel> myEvent = [];

    myEvent = await eventHttpServices.getMyEvents(localId);
    return myEvent;
  }

  Future<List<EventModel>> getAllEvents() async {
    List<EventModel> allEvent = [];

    allEvent = await eventHttpServices.getAllEvents();
    return allEvent;
  }
}
