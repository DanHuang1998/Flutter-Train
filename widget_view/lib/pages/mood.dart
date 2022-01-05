
import 'package:flutter/material.dart';

class MoodPage extends StatelessWidget{
  final List<TabElement> tabElementList = [
    TabElement('mad', Icons.mood),
    TabElement('bad', Icons.mood_bad_outlined),
    TabElement('falling', Icons.mood_bad_rounded),
    TabElement('down', Icons.mood_bad_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabElementList.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('表情符號'),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.yellowAccent,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.yellowAccent,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: tabElementList.map((element){
              return Tab(text: element.label, icon: Icon(element.icon),);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: tabElementList.map((element){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'I feel ${element.label}',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 40,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 20)),
                Icon(element.icon, color: Colors.deepPurple, size: 72,)
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

}

class TabElement{
  final String label;
  final IconData icon;
  TabElement(this.label, this.icon);
}