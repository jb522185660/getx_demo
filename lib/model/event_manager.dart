class EventManager {
  String? event;
  dynamic data;

  EventManager({
    this.event,
    this.data
  });

  @override
  String toString() {
    return "event:$event data:$data";
  }
}