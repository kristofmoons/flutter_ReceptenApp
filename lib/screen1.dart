import 'package:flutter/material.dart';
import 'package:flutter_project/videoPlayer.dart';
import 'data.dart' as lib;

class Scherm1 extends StatelessWidget {
  const Scherm1({super.key});

  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Column(
        children: lib.recipes.map((recipe) {
          return Container(
              padding: EdgeInsets.all(2),
              height: 110,
              child: Card(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                    Image(
                      image: AssetImage("${recipe.image}"),
                      fit: BoxFit.cover,
                      width: 180,
                    ),
                    Expanded(
                        child: Container(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('${recipe.name}',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text('${recipe.categoryType.name}'),
                              ],
                            ))),
                    Center(
                      child: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondRoute(
                                    name: '${recipe.name}',
                                    img: '${recipe.image}',
                                    guide: '${recipe.guide}',
                                    video: '${recipe.video}')),
                          );
                        },
                      ),
                    ),
                  ])));
        }).toList(),
      )
    ]);
  }
}

class SecondRoute extends StatefulWidget {
  late String name;
  late String img;
  late String guide;
  late String video;

  SecondRoute(
      {Key? key,
      required this.name,
      required this.img,
      required this.guide,
      required this.video})
      : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  bool? videoOrPhoto = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Expanded(
            child: videoOrPhoto == false
                ? Image.asset(widget.img)
                : Mp4Player(video: widget.video),
          ),
          Column(children: [
            widget.video != 'none'
                ? CheckboxListTile(
                    //checkbox positioned at right
                    value: videoOrPhoto,

                    onChanged: (bool? value) {
                      setState(() {
                        videoOrPhoto = value;
                      });
                    },
                    title: Text("Do you want to play the video?"),
                  )
                : Text('No video available for this recipe.'),
            Container(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  widget.guide,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ]),
        ]));
  }
}
