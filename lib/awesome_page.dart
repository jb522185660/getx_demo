import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data_controller.dart';

class AwesomePage extends GetView<DataController> {
  const AwesomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("awesome"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "用户信息:${controller.user.value.toString()}"
            )
          ],
        ),
      ),
    );
  }
}
