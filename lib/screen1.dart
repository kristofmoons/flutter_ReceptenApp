import 'package:flutter/material.dart';
import 'package:flutter_project/audioPlayer.dart';
import 'package:flutter_project/videoPlayer.dart';
import 'data.dart' as lib;

class Scherm1 extends StatefulWidget {
  const Scherm1({super.key});

  @override
  State<Scherm1> createState() => _Scherm1State();
}

class _Scherm1State extends State<Scherm1> {
  String keuze = 'All';

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> opties = <DropdownMenuItem<String>>[];
    opties.add(DropdownMenuItem(child: Text('All'), value: "All"));
    opties.add(DropdownMenuItem(child: Text('itallian'), value: "itallian"));
    opties.add(DropdownMenuItem(child: Text('dessert'), value: "dessert"));
    opties.add(DropdownMenuItem(child: Text('asian'), value: "asian"));

    return SingleChildScrollView(
        child: Column(children: <Widget>[
      Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black38, width: 3), //border of dropdown button
            borderRadius:
                BorderRadius.circular(50), //border raiuds of dropdown button
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: DropdownButton(
              items: opties,
              isExpanded: true,
              value: keuze,
              underline: Container(),
              style: const TextStyle(fontSize: 18),
              onChanged: (value) {
                setState(() {
                  keuze = value!;
                });
              },
            ),
          )),
      Column(
        children: keuze == 'All'
            ? lib.recipes.map((recipe) {
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('${recipe.name}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                          video: '${recipe.video}',
                                          audio: '${recipe.audio}')),
                                );
                              },
                            ),
                          ),
                        ])));
              }).toList()
            : lib.recipes
                .where((recipe) => recipe.categoryType.name == keuze)
                .map((recipe) {
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Text('${recipe.name}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
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
                                            video: '${recipe.video}',
                                            audio: '${recipe.audio}',
                                          )),
                                );
                              },
                            ),
                          ),
                        ])));
              }).toList(),
      )
    ]));
  }
}

class SecondRoute extends StatefulWidget {
  late String name;
  late String img;
  late String guide;
  late String video;
  late String audio;

  SecondRoute(
      {Key? key,
      required this.name,
      required this.img,
      required this.guide,
      required this.video,
      required this.audio})
      : super(key: key);

  @override
  State<SecondRoute> createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  bool? videoOrPhoto = false;
  bool? wantsAudio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: ListView(scrollDirection: Axis.vertical, children: [
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 360,
              ),
              child: videoOrPhoto == false
                  ? Image.asset(widget.img)
                  : Mp4Player(video: widget.video),
            ),
          ),
          if (wantsAudio == true) Mp3Player(audio: widget.audio),
          Column(children: [
            widget.video != 'none'
                ? CheckboxListTile(
                    value: videoOrPhoto,
                    onChanged: (bool? value) {
                      setState(() {
                        videoOrPhoto = value;
                      });
                    },
                    title: Text("Do you want to play the video?"),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Text(
                      'No video available for this recipe.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
            widget.audio != 'none'
                ? CheckboxListTile(
                    value: wantsAudio,
                    onChanged: (bool? value) {
                      setState(() {
                        wantsAudio = value;
                      });
                    },
                    title: Text("Do you want to play audio?"),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'No audio available for this recipe.',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      'Guide',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
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
                  ),
                ],
              ),
            )
          ]),
        ]));
  }
}
