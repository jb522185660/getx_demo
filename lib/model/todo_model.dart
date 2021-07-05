import 'package:flutter_demo/model/cache.dart';
import 'package:get/get.dart';

class TodoModel extends GetxController implements Cache{
  final content = "default".obs;

  final ex = Rx(TodoExtModel());

  TodoModel();

  @override
  getByKey(String key) {
    return TodoModel(
    );
  }

  @override
  void setByKey(String key, value) {
    print('setByKey');
  }

  @override
  String toString() {
    return "content:$content id:${ex.value.id} ex:${ex.value.ex}";
  }
}

class TodoExtModel {
  int? id;
  String? ex;
  TodoExtModel({
    this.id,
    this.ex
  });
}