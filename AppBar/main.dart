import 'package:flutter/material.dart';

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
  int _counter = 0;
  List tabList = <TabElements>[
    TabElements('mood', Icons.mood),
    TabElements('bad_outlined', Icons.mood_bad_outlined),
    TabElements('bad_rounded', Icons.mood_bad_rounded),
    TabElements('bad_sharp', Icons.mood_bad_sharp),
    TabElements('outlined', Icons.mood_outlined)
  ];

  void _incrementCounter() {
    setState((){
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(
                Icons.west_outlined,
              color: Colors.white,
            ),
            onPressed: _incrementCounter,
            tooltip: 'Exit',
          ),
          actions: <Widget> [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.baby_changing_station),
              onPressed: null,
            ),
          ],
          bottom: TabBar(
            tabs: tabList.map((element){
              return Tab(
                text: element.title,
                icon: Icon(element.icon),
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'This is ${element.title}',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 40,
                    fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  'Now i feel ${element.title}',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontStyle: FontStyle.italic
                  ),
                ),
                Text(
                  'Count: $_counter',
                  style: TextStyle(
                    fontSize: 20,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                Icon(
                  element.icon,
                  size: 50,
                  color: Colors.blue,
                ),
              ],
            );
          }).toList(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Touch the add button will increase the count number',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class TabElements{
  String title;
  IconData icon;
  TabElements(this.title, this.icon);
}

