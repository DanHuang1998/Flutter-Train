import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  final List<TabElement> cardList = [
    TabElement('birthday', Icons.cake, 'Happy birthday!', 'images/birthday.jpg', Colors.amber.withOpacity(0.5)),
    TabElement('green', Icons.grass, 'Grass down your feet!', 'images/grass.jpg', Colors.lightGreen.withOpacity(0.3))
  ];
  CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: cardList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('卡片'),
          bottom: TabBar(
            tabs: cardList.map((element){
              return Tab(text: element.label, icon: Icon(element.icon),);
            }).toList(),
            isScrollable: true,
            labelColor: Colors.yellow,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.yellow,
          ),
        ),
        body: TabBarView(
          children: cardList.map((element){
            return buildCardWidget(context, element.content, element.picSrc, element.backgroundColor);
          }).toList(),
        ),
      ),
    );
  }
}

Widget buildCardWidget(BuildContext context, String content, String foreGroundImage, Color backgroundColor){
  return Container(
    child: Container(
      child: Text(content, style: Theme.of(context).textTheme.headline5,),
      transform: Matrix4.rotationZ(-0.25),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(foreGroundImage), fit: BoxFit.fill),
      ),
    ),
    padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 50.0),
    transform: Matrix4.rotationZ(0.1),
    decoration: BoxDecoration(
      color: backgroundColor,
    ),
  );
}

class TabElement{
  final String label, content, picSrc;
  final IconData icon;
  final Color backgroundColor;
  TabElement(this.label, this.icon, this.content, this.picSrc, this.backgroundColor);
}