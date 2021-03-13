import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter_sound/flutter_sound.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    for (int i = 1; i <= 7; i++) {
      final player = AudioCache();
      player.load('note$i.wav');
    }

    void playSound(int number) {
      final player = AudioCache();
      player.play('note$number.wav');
    }

    List<Expanded> buildXylo() {
      List<Color> colors = [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.teal,
        Colors.blue,
        Colors.purple
      ];
      List<Expanded> xylo = [];

      for (int i = 0; i < 7; i++) {
        xylo.add(Expanded(
          child: FlatButton(
            color: colors[i],
            onPressed: () {
              playSound(i + 1);
            },
            padding: EdgeInsets.all(0.0), //adds padding inside the button
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ));
      }
      return xylo;
    }

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: buildXylo(),
          ),
        ),
      ),
    );
  }
}
