import 'dart:async';

import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'model/event_manager.dart';

class BusPage extends StatefulWidget {
  const BusPage({Key? key}) : super(key: key);

  @override
  _BusPageState createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  EventBus _eventBus = EventBus();
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = _eventBus.on<EventManager>().listen((event) {
      print(event.event);
      print(event.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _fire();
              }, 
              child: Text("fire")
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }
  
  void _fire() {
    _eventBus.fire(EventManager(
      event: "login",
      data: {
        "id": 1,
        "name": "jack"
      }
    ));
  }
  
}
