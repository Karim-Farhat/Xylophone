import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey(int n1, color) {
    return Expanded(
      child: TextButton(
        onPressed: () {
          playSound(n1);
        },
        style: ButtonStyle(enableFeedback: false),
        child: Container(
          width: double.maxFinite,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(children: [
            buildKey(1, Colors.red),
            buildKey(2, Colors.orange),
            buildKey(3, Colors.yellow),
            buildKey(4, Colors.green),
            buildKey(5, Colors.teal),
            buildKey(6, Colors.indigo),
            buildKey(7, Colors.purple),
          ]),
        ),
      ),
    );
  }
}
