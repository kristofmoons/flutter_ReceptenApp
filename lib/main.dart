import 'package:flutter/material.dart';
import 'package:flutter_project/screen1.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_project/screen2.dart';

void main() {
  runApp(AppRoot());
}

class AppRoot extends StatefulWidget {
  @override
  State<AppRoot> createState() => _AppRootState();
}

bool _iconBool = false;

IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);

ThemeData _darkTheme =
    ThemeData(primarySwatch: Colors.red, brightness: Brightness.dark);

class _AppRootState extends State<AppRoot> {
  Widget build(BuildContext buildContext) => MaterialApp(
        theme: _iconBool ? _darkTheme : _lightTheme,
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Taste Trail"),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      _iconBool = !_iconBool;
                    });
                  },
                  icon: Icon(_iconBool ? _iconDark : _iconLight),
                ),
              ],
            ),
            body: TabBarView(
                children: <Widget>[AppTree(), Scherm1(), Scherm2(), Scherm3()]),
            bottomNavigationBar: TabBar(
                labelColor:
                    _iconBool ? Colors.white : Colors.black.withOpacity(1),
                indicatorColor: _iconBool ? Colors.white : Colors.black,
                tabs: const [
                  Tab(text: 'Home', icon: Icon(Icons.home)),
                  Tab(text: 'alle recepten', icon: Icon(Icons.restaurant_menu)),
                  Tab(text: 'mijn recepten', icon: Icon(Icons.food_bank)),
                  Tab(text: 'Settings', icon: Icon(Icons.settings)),
                ]),
          ),
        ),
      );
}

class AppTree extends StatelessWidget {
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  'https://static1.cbrimages.com/wordpress/wp-content/uploads/2021/11/a329ecf1f6777cdf7b8e4bce0379cfc0-e1637613301872.jpg',
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Padding(
              padding:
                  const EdgeInsets.all(30), //apply padding to all four sides
              child: Text(
                "taste trail\nFlexibiliteit op z'n lekkerst",
                style: TextStyle(
                    color: Colors.white.withOpacity(1),
                    fontSize: 38.0,
                    height: 1.4,
                    fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}

class Scherm3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container(color: Colors.blue);
  }
}
