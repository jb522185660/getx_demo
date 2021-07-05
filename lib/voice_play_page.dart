import 'package:flutter/material.dart';
import 'voice_animation_image.dart';

class VoicePlayPage extends StatefulWidget {
  const VoicePlayPage({Key? key}) : super(key: key);

  @override
  _VoicePlayPageState createState() => _VoicePlayPageState();
}

class _VoicePlayPageState extends State<VoicePlayPage> {
  bool _play = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("语音播放"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              color: Colors.greenAccent,
              child: VoiceAnimationImage(
                [
                  "assets/images/left_voice_1.png",
                  "assets/images/left_voice_2.png",
                  "assets/images/left_voice_3.png",
                ],
                width: 50,
                height: 50,
                isStop: !_play,
              ),
            ),
            ElevatedButton(
              child: Text(_play?"stop":"play"),
              onPressed: () {
                setState(() {
                  _play = !_play;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
