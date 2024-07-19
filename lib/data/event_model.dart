class EventModel {
  final String event_id;
  final String event_user_id;
  final String description;
  final String name;
  final String event_time;
  final String event_date;
  final String event_location;
  EventModel({
    required this.event_id,
    required this.event_user_id,
    required this.description,
    required this.name,
    required this.event_time,
    required this.event_date,
    required this.event_location,
  });
}
