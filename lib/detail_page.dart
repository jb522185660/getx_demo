import 'package:flutter/material.dart';
import 'package:flutter_demo/data_controller.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({ Key? key }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  DataController dataController = Get.find();

  @override
  void initState() {
    super.initState();
    print(Get.arguments);
    print(Get.parameters);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "详细页"
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
                "arguments参数:${Get.arguments}"
            ),
            Text(
                "parameters参数:${Get.parameters}"
            ),
            Text(
                "DataController count:${dataController.count}"
            ),
            SizedBox(height: 50),
            _userInfoWidget(),
            SizedBox(height: 100),
            ElevatedButton(
              child: Text("改变用户信息"),
              onPressed: () {
                print("test");
                test();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _userInfoWidget() {
    return ObxValue(
      (Rx<User> user) {
        return Container(
          width: double.infinity,
          height: 100,
          color: Colors.green,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "name:${user.value.name}",
                style: TextStyle(
                  color: Colors.white
                ),
              ),
              Text(
                "last:${user.value.last}",
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              Text(
                "age:${user.value.age}",
                style: TextStyle(
                    color: Colors.white
                ),
              )
            ],
          ),
        );
      },
      dataController.user
    );

  }

  test() {
    dataController.changeUserInfo();
  }
}
