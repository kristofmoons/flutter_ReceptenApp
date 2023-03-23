import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Scherm1 extends StatelessWidget {
  const Scherm1({super.key});

  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
            padding: EdgeInsets.all(2),
            height: 110,
            child: Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  Image.asset("assets/tiramisu.jpg"),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('tiramisu',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('30 min'),
                            ],
                          ))),
                  FirstRoute(),
                ]))),
        Container(
            padding: EdgeInsets.all(2),
            height: 110,
            child: Card(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                  Image.asset("assets/tiramisu.jpg"),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text('tiramisu',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              Text('30 min'),
                            ],
                          )))
                ]))),
      ],
    );
  }
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondRoute()),
          );
        },
      ),
    );
  }
}

class SecondRoute extends StatefulWidget {
  const SecondRoute({super.key});

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Route'),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Expanded(
            child: Image.asset('assets/tiramisu.jpg'),
          ),
          Column(children: [
            Text("Put your Text Here!!!!"),
            Container(
              color: Colors.blue,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Splits de eieren. Zorg er voor dat er absoluut geen eigeel bij het eiwit komt.' +
                      ' Mix de eigelen met de suiker in een paar minuten tot een licht geel en luchtig mengsel. Mix de mascarpone er door. Maak de mixer en kom goed schoon en vetvrij en klop daarna de eiwitten helemaal stijf. Spatel het eiwit door het mascarpone mengsel.',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Mp4Player(),
          ]),
        ]));
  }
}

class Mp4Player extends StatefulWidget {
  _Mp4PlayerState createState() => _Mp4PlayerState();
}

class _Mp4PlayerState extends State<Mp4Player> {
  VideoPlayerController videoController =
      VideoPlayerController.asset("assets/video/tiramisu.mp4");

  void initState() {
    videoController.setLooping(true);
    videoController.initialize();
    super.initState();
  }

  Widget build(BuildContext context) {
    bool isVisible = true;

    return Column(children: <Widget>[
      AspectRatio(
          aspectRatio: 640 / 360, // breedte gedeeld door hoogte
          child: VideoPlayer(videoController)),
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
