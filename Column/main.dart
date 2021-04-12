import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:transparent_image/transparent_image.dart';

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
    TabElements('sunny', 'sunny', FontAwesomeIcons.sun, 'https://thumbs.dreamstime.com/z/sunny-cartoon-vector-sunny-weather-icon-concept-illustration-sunny-cartoon-vector-sunny-weather-icon-concept-illustration-isolated-178014091.jpg'),
    TabElements('rainy', 'rainy', FontAwesomeIcons.cloudRain, 'https://st2.depositphotos.com/6836544/11550/v/950/depositphotos_115509702-stock-illustration-rain-cloud-as-rainy-weather.jpg'),
    TabElements('cloud', 'cloud', FontAwesomeIcons.cloud, 'https://previews.123rf.com/images/onyxprj/onyxprj1811/onyxprj181100138/111240123-fluffy-cartoon-clouds-shine-sky-weather-illustration-panorama-clean-vector-set-isolated-cloudscape-a.jpg'),
    TabElements('snow', 'snow', FontAwesomeIcons.snowman, 'https://previews.123rf.com/images/carbo82/carbo821206/carbo82120600077/14181782-icon-weather-snow.jpg'),
    TabElements('wind', 'wind', FontAwesomeIcons.wind, 'https://thumbs.dreamstime.com/z/windy-weather-icon-cartoon-style-isolated-white-background-windy-weather-icon-cartoon-style-isolated-white-background-113233458.jpg')
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  'Today\'s wheather is ${element.text}',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 25,
                    fontStyle: FontStyle.italic
                  ),
                ),
                Flexible(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'asset_image/loading.gif',
                    image: element.img
                  )
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TabElements{
  String title, text, img;
  IconData icon;
  TabElements(this.title, this.text, this.icon, this.img);
  String getImg(){return img;}
}

