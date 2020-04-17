class EventData {
  static final EventData _eventData = new EventData._internal();

  List<Object> events = [
    'Summer Bash 2020',
    "Central Park Movie Night!",
    "New York Fair",
    "Art At The Park",
    "Fashion Week"
  ];

  factory EventData() {
    return _eventData;
  }
  EventData._internal();
}
final eventData = EventData();