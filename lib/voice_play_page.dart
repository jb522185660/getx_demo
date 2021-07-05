import 'package:flutter/material.dart';
import 'voice_animation_image.dart';

class VoicePlayPage extends StatefulWidget {
  const VoicePlayPage({Key? key}) : super(key: key);

  @override
  _VoicePlayPageState createState() => _VoicePlayPageState();
}

class _VoicePlayPageState extends State<VoicePlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("语音播放"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
