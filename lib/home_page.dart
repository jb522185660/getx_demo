import 'package:flutter/material.dart';
import 'package:flutter_demo/awesome_page.dart';
import 'package:flutter_demo/detail_page.dart';
import 'package:flutter_demo/single_controller.dart';
import 'package:flutter_demo/single_page.dart';
import 'package:flutter_demo/stream_test_page.dart';
import 'package:get/get.dart';

import 'data_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DataController c = Get.put(DataController());

    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text("detail"),
              onPressed: () {
                Get.toNamed("/detail?name=Enzo", arguments: {"id":666});
              },
            ),
            ElevatedButton(
              child: Text("awesome"),
              onPressed: () {
                Get.to(AwesomePage());
              },
            ),
            ElevatedButton(
              child: Text("single"),
              onPressed: () {
                Get.to(
                      () => SinglePage(),
                  binding: BindingsBuilder.put(() => SingleController()),
                  preventDuplicates: false,
                );
              },
            ),
            ElevatedButton(
              child: Text("stream"),
              onPressed: () {
                Get.to(StreamTestPage());
              },
            ),
            ObxValue((RxBool data) => Switch(
                value: data.value,
                onChanged: data, 
              ),
              false.obs,
            ),
          ],
        ),
      )
    );
  }

  void _incrementCounter() {
    final DataController c = Get.find();
    c.increment();
  }
}