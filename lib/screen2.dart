import 'package:flutter/material.dart';
import 'package:flutter_project/createRecipe.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'data2.dart' as lib;

class Scherm2 extends StatefulWidget {
  const Scherm2({super.key});

  @override
  State<Scherm2> createState() => _Scherm2State();
}

class _Scherm2State extends State<Scherm2> {
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
      Container(
          padding: EdgeInsets.all(2),
          height: 110,
          child: Card(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                Image(
                  image: AssetImage("images/placeholder.jpg"),
                  fit: BoxFit.cover,
                  width: 180,
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text('create a new recipe',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ))),
                Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThirdRoute()),
                      );
                    },
                  ),
                ),
              ]))),
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
                          CachedNetworkImage(
                            imageUrl: recipe.image,
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
                                          )),
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
                          CachedNetworkImage(
                            imageUrl: recipe.image,
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
  final String name;
  final String img;
  final String guide;

  const SecondRoute({
    Key? key,
    required this.name,
    required this.img,
    required this.guide,
  }) : super(key: key);

  @override
  _SecondRouteState createState() => _SecondRouteState();
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
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          Expanded(child: Image.network(widget.img)),
          Column(
            children: [
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
            ],
          ),
        ],
      ),
    );
  }
}

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({
    Key? key,
  }) : super(key: key);

  @override
  _ThirdRouteState createState() => _ThirdRouteState();
}

class _ThirdRouteState extends State<ThirdRoute> {
  bool? videoOrPhoto = false;
  bool? wantsAudio = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new"),
      ),
      body: CreateRecipe(),
    );
  }
}
