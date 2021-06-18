import 'package:flutter/material.dart';
import 'package:flutter_demo/detail_page.dart';
import 'package:flutter_demo/home_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: MyApp(),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/detail", page: () => DetailPage())
      ],
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GetX Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
