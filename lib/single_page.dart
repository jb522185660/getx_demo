import 'package:flutter/material.dart';
import 'package:flutter_demo/single_controller.dart';
import 'package:get/get.dart';

class SinglePage extends GetWidget<SingleController> {
  const SinglePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("single"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              return Text(
                "count:${controller.count}"
              );
            }),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                controller.increment();
              },
              child: Text("add count")
            )
          ],
        ),
      ),
    );
  }
}
