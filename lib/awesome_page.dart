import 'package:flutter/material.dart';
import 'package:flutter_demo/model/todo_model.dart';
import 'package:get/get.dart';
import 'data_controller.dart';
import 'method/common_method.dart';

class AwesomePage extends GetView<DataController> {
  const AwesomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TodoModel todo = Get.put(TodoModel());

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
            ),
            ElevatedButton(
              child: Text("操作泛型方法"),
              onPressed: () {
                testMethod();
              },
            ),
            Obx(() {
              return Text(
                "todo信息:${todo.toString()}"
              );
            }),
            ElevatedButton(
              child: Text("改变todo信息"),
              onPressed: () {
                changeTodoMethod();
              },
            ),
          ],
        ),
      ),
    );
  }

  void testMethod() {
    var result = second(['one','two']);
    print(result);
  }

  void changeTodoMethod() {
    final TodoModel todo = Get.find();
    todo.ex(
      TodoExtModel(
        id: 3,
        ex: "ex 3"
      )
    );
    // todo.ex.update((val) {
    //   val!.id = 1;
    //   val.ex = "ex 1";
    // });
  }
}
