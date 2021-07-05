import 'package:flutter/material.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';

class KeyboardTestPage extends StatelessWidget {
  const KeyboardTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Keyboard test"),
      ),
      body: Stack(
        children: [
          Positioned(
            child: SafeArea(
              child: FooterLayout(
                footer: KeyboardAttachableFooter(),
                child: ColorsList(),
              )
            ),
          )
        ],
      ),
    );
  }
}

class KeyboardAttachableFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => KeyboardAttachable(
    backgroundColor: Colors.blue,
    child: Container(
      padding: const EdgeInsets.all(16),
      color: Colors.blue,
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Tap me!",
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(),
        ),
      ),
    ),
  );
}

class ColorsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) => ListView.builder(
    itemExtent: 66,
    itemCount: Colors.primaries.length,
    itemBuilder: (_, i) => Container(
      color: Colors.primaries[i].withOpacity(0.2),
    ),
  );
}

