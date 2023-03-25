import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Mp4Player extends StatefulWidget {
  final String video;

  Mp4Player({Key? key, required this.video}) : super(key: key);

  @override
  _Mp4PlayerState createState() => _Mp4PlayerState();
}

class _Mp4PlayerState extends State<Mp4Player> {
  late VideoPlayerController videoController;

  @override
  void initState() {
    videoController = VideoPlayerController.asset(widget.video);
    videoController.setLooping(true);
    videoController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isVisible = true;

    return Column(children: <Widget>[
      AspectRatio(
        aspectRatio: 640 / 360, // breedte gedeeld door hoogte
        child: VideoPlayer(videoController),
      ),
      ElevatedButton(
        onPressed: () {
          setState(() {
            videoController.value.isPlaying
                ? videoController.pause()
                : videoController.play();
          });
        },
        child: videoController.value.isPlaying
            ? Icon(Icons.pause, size: 60)
            : Icon(Icons.play_arrow, size: 60),
      ),
    ]);
  }
}
