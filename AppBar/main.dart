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
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List tabList = <TabElements>[
    TabElements('Mood', Icons.mood),
    TabElements('Mood_bad', Icons.mood_bad_outlined)
  ];

  void _incrementCounter() {
    setState((){
      _counter++;
    });
  }

  void _decreaseCounter(){
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabList.length,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            leading: Icon(Icons.west_outlined),
            actions: <Widget> [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: _decreaseCounter,
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
                      fontSize: 20,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  Text(
                    'Count: $_counter',
                    style: TextStyle(
                      fontSize: 40,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  Icon(
                    element.icon,
                    size: 100,
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

