import 'package:flutter/material.dart';
import 'package:flutter_plugin_record/flutter_plugin_record.dart';
import 'package:flutter_plugin_record/widgets/voice_widget.dart';

class SoundRecordPage extends StatefulWidget {
  const SoundRecordPage({Key? key}) : super(key: key);

  @override
  _SoundRecordPageState createState() => _SoundRecordPageState();
}

class _SoundRecordPageState extends State<SoundRecordPage> {
  FlutterPluginRecord  _recordPlugin = new FlutterPluginRecord();

  @override
  void initState() {
    super.initState();

//    初始化
    _recordPlugin.init();

    ///初始化方法的监听
    _recordPlugin.responseFromInit.listen((data) {
      if (data) {
        print("初始化成功");
      } else {
        print("初始化失败");
      }
    });

    _recordPlugin.response.listen((data) {
      if (data.msg == "onStop") {
        ///结束录制时会返回录制文件的地址方便上传服务器
        print("onStop  " + data.path!);
      } else if (data.msg == "onStart") {
        print("onStart --");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sound record"),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100),
            VoiceWidget(
              decoration: BoxDecoration(
                border: Border.all(width: 0, color: Colors.white),
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(5))
              ),
            ),
            ElevatedButton(
              child: Text("录音"),
              onPressed: () {
                _record();
              },
            ),
            ElevatedButton(
              child: Text("停止"),
              onPressed: () {
                _stop();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _record() {
    _recordPlugin.start();
  }

  void _stop() {
    _recordPlugin.stop();
  }
}
