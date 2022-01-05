import 'package:flutter/material.dart';
import 'card.dart';
import 'counter.dart';
import 'mood.dart';
import 'weather.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.dehaze_outlined),
          onPressed: () => _globalKey.currentState.openDrawer(),
        ),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Searching'),
                    //width: context.size.width*0.5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    behavior: SnackBarBehavior.floating,
                    duration: Duration(seconds: 1),
                    action: SnackBarAction(
                      label: 'pass',
                      textColor: Colors.white,
                      onPressed: ()=>{},
                    )
                )
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('User'),
              accountEmail: Text('account@host.com'),
              currentAccountPicture: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 60,
              ),
              decoration: BoxDecoration(color: Colors.deepPurple),
            ),
            ListTile(
              leading: Icon(Icons.timer),
              title: Text('計數器'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (buildContext) => CounterPage())),
            ),
            ListTile(
              leading: Icon(Icons.cloud),
              title: Text('天氣'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext buildContext) => WeatherPage())),
            ),
            ListTile(
              leading: Icon(Icons.mood),
              title: Text('表情符號'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext buildContext) => MoodPage())),
            ),
            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('卡片'),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (buildContext) => CardPage())),
            )
          ],
        ),
      ),
      body: Center(
        child: Text('Hello world'),
      ),
    );
  }
}