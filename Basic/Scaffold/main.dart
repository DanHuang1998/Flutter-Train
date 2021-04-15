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
  String accountName = 'User', accountEmail = 'userName@server.com';
  List<NavigationItem> list = [
    NavigationItem('sun', FontAwesomeIcons.sun),
    NavigationItem('rain', FontAwesomeIcons.cloudRain),
    NavigationItem('snow', FontAwesomeIcons.snowman),
    NavigationItem('wind', FontAwesomeIcons.wind)
  ];
  int onTapIndex = 0;

  List<Widget> bodyContext = [
    FadeInImage.assetNetwork(
        placeholder: 'asset_image/loading.gif',
        image: 'https://media.giphy.com/media/Q5jq8b6BvEtjbcXhlg/giphy.gif'
    ),
    FadeInImage.assetNetwork(
        placeholder: 'asset_image/loading.gif',
        image: 'https://media.giphy.com/media/xUOwGoNa2uX6M170d2/giphy.gif'
    ),
    FadeInImage.assetNetwork(
        placeholder: 'asset_image/loading.gif',
        image: 'https://media.giphy.com/media/5AbWXWr67pV6y8OhR0/giphy.gif'
    ),
    FadeInImage.assetNetwork(
        placeholder: 'asset_image/loading.gif',
        image: 'https://media.giphy.com/media/fYTUarigdyZyvwFQsU/giphy.gif'
    )
  ];
  TextStyle textStyle = TextStyle(
      fontSize: 35.0,
      fontStyle: FontStyle.italic
  );



  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
              title: Text(widget.title),
              leading: IconButton(
                  icon: Icon(Icons.west_outlined),
                  onPressed: () => {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You press the exit!',
                            style: TextStyle(
                              fontSize: 16,
                              fontStyle: FontStyle.italic
                            ),
                          ),
                          action: SnackBarAction(
                            label: 'Pause',
                            textColor: Colors.white,
                            onPressed: ()=>{},
                          ),
                          duration: Duration(milliseconds: 2000),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)
                          ),
                          behavior: SnackBarBehavior.floating,
                          width: context.size.width*0.75,
                          padding: EdgeInsets.symmetric(
                            horizontal: 25.0
                          ),
                        )
                    )
                  },
                  tooltip: 'Exit',
              ),
              actions: <Widget> [
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: ()=>{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarItem('Searching...', context.size.width*0.5).getSnackBar()
                      )
                    },
                ),
              ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text(
                      accountName,
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.normal
                    ),
                  ),
                  accountEmail: Text(
                      accountEmail,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  currentAccountPicture: Icon(
                      Icons.account_circle,
                    color: Colors.white,
                    size: 72,
                  ),
                  decoration: BoxDecoration(color: Colors.deepPurple[300]),
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Account'),
                  onTap: ()=>{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBarItem('Account', context.size.width*0.5).getSnackBar()
                    ),
                    Navigator.pop(context),
                  },
                ),
                ListTile(
                  leading: Icon(Icons.monetization_on_rounded),
                  title: Text('Money'),
                  onTap: ()=>{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarItem('Money', context.size.width*0.5).getSnackBar()
                    ),
                    Navigator.pop(context),
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Setting'),
                  onTap: ()=>{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarItem('Setting', context.size.width*0.5).getSnackBar()
                    ),
                    Navigator.pop(context),
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: ()=>{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBarItem('Logout', context.size.width*0.5).getSnackBar()
                    ),
                    Navigator.pop(context),
                  },
                )
              ],
            ),
          ),
          body: Column(
            children: [
              Text(
                  'Today\'s wheather is ${list.elementAt(onTapIndex).label}',
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              bodyContext.elementAt(onTapIndex),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        bottomNavigationBar: BottomNavigationBar(
          items: list.map((element){
            return BottomNavigationBarItem(
                icon: Icon(element.icon),
              label: element.label,
              backgroundColor: Colors.yellow,
            );
          }).toList(),
          currentIndex: onTapIndex,
          selectedItemColor: Colors.deepPurple,
          onTap: (int index) {
            setState(() {
              onTapIndex = index;
            });
          },
        ),
      );
  }
}

class NavigationItem{
  IconData icon;
  String label;
  NavigationItem(this.label, this.icon);
}

class SnackBarItem{
  SnackBar snackBar;
  SnackBarItem(String data, double width){
    snackBar = SnackBar(
      content: Text(
          data,
        style: TextStyle(
            fontSize: 16.0,
          fontStyle: FontStyle.italic,
        ),
      ),
        width: width,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        behavior: SnackBarBehavior.floating,
        duration: Duration(milliseconds: 2000),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        action: SnackBarAction(
          label: 'pass',
          textColor: Colors.white,
          onPressed: ()=>{},
        )
    );
  }
  SnackBar getSnackBar(){return snackBar;}
}