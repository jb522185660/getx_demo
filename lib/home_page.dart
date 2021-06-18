import 'package:flutter/material.dart';
import 'package:flutter_demo/awesome_page.dart';
import 'package:flutter_demo/detail_page.dart';
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
            Text(
              'You have pushed the button this many times:',
            ),
            Obx(() => Text("Clicks: ${c.count}")),
            InkWell(
              onTap: () {
                // Get.to(DetailPage());
                Get.toNamed("/detail?name=Enzo", arguments: {"id":666});
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.greenAccent,
              ),
            ),
            ElevatedButton(
              child: Text("awesome"),
              onPressed: () {
                Get.to(AwesomePage());
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _incrementCounter() {
    final DataController c = Get.find();
    c.increment();
  }
}