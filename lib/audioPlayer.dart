import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class Mp3Player extends StatefulWidget {
  final String audio;

  Mp3Player({Key? key, required this.audio}) : super(key: key);

  @override
  State<Mp3Player> createState() => _Mp3PlayerState();
}

class _Mp3PlayerState extends State<Mp3Player> {
  final AudioPlayer audioSpeler = AudioPlayer();

  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Padding(padding: EdgeInsets.only(left: 5)),
      Expanded(
        child: ElevatedButton(
            onPressed: () {
              audioSpeler.play(AssetSource(widget.audio), volume: 1);
            },
            child: Text('Speel audio', textScaleFactor: 2)),
      ),
      Padding(padding: EdgeInsets.all(5)),
      Expanded(
        child: ElevatedButton(
            onPressed: () {
              audioSpeler.stop();
            },
            child: Text('stop audio', textScaleFactor: 2)),
      ),
      Padding(padding: EdgeInsets.only(right: 5)),
    ]);
  }
}
