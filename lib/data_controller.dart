import 'package:get/get.dart';

class DataController extends GetxController{
  var count = 0.obs;
  increment() {
    count ++;
  }


  final user = User(name: 'John', last: 'Doe', age: 33).obs;

  changeUserInfo() {
    increment();
    user.update((val) {
      val!.name = "test name" + "$count";
      val.last = "test last" + "$count";
      val.age = count.value;
    });
  }
}

class User {
  String? name, last;
  int? age;
  User({this.name, this.last, this.age});

  @override
  String toString() => '$name $last, $age years old';
}
