import 'package:flutter_demo/model/cache.dart';

class TodoModel implements Cache{
  String? content;

  TodoModel({
    this.content
  });

  @override
  getByKey(String key) {
    return TodoModel(
      content: "缓存"
    );
  }

  @override
  void setByKey(String key, value) {
    print('setByKey');
  }

}