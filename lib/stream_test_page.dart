import 'dart:async';

import 'package:flutter/material.dart';

class StreamTestPage extends StatefulWidget {
  const StreamTestPage({Key? key}) : super(key: key);

  @override
  _StreamTestPageState createState() => _StreamTestPageState();
}

class _StreamTestPageState extends State<StreamTestPage> {
  StreamController<int> _counterStreamController = StreamController<int>(
    onListen: () {
      print("listen");
    },
    onCancel: () {
      print("cancel");
    }
  );

  int _counter = 0;
  Stream<int>? _counterStream;
  // ignore: close_sinks
  StreamSink? _counterSink;

  @override
  void initState() {
    super.initState();
    _counterSink = _counterStreamController.sink;
    _counterStream = _counterStreamController.stream;
    _counterStream!.listen((event) {
      setState(() {
        _counter = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stream"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "$_counter"
            ),
            ElevatedButton(
              child: Text("incrementCounter"),
              onPressed: () {
                _incrementCounter();
              },
            ),
            ElevatedButton(
              child: Text("closeStream"),
              onPressed: () {
                _closeStream();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {
    _counter ++;
    _counterSink!.add(_counter);
  }

  // 主动关闭流
  void _closeStream() {
    _counterStreamController.close();
  }
}
