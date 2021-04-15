import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TabElements> tabList = [
    TabElements('square', 100, 200, Icons.accessibility_sharp),
    TabElements('rectangle', 75, 100, Icons.accessibility)
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(Icons.west_outlined),
            onPressed: null,
            tooltip: 'Exit',
          ),
          actions: <Widget> [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
            ),
          ],
          bottom: TabBar(
            tabs: tabList.map((element){
              return Tab(
                text: element.shape,
                icon: Icon(element.iconData),
              );
            }).toList(),
            isScrollable: true,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.yellow,
          ),
        ),
        body: TabBarView(
          children: tabList.map((element){
            return Container(
              child: Container(
                child: Center(
                  child: Text(
                    'This is ${element.shape}',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black
                    ),
                  ),
                ),
                transform: Matrix4.rotationZ(-0.4),
                color: Colors.tealAccent,
              ),
              padding: EdgeInsets.fromLTRB(element.width, element.height, element.width, element.height),
              transform: Matrix4.rotationZ(0.15),
              color: Colors.amber,
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TabElements{
  String shape;
  IconData iconData;
  double width, height;
  TabElements(this.shape, this.width, this.height, this.iconData);
}

