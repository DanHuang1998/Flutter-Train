import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget{

  @override
  CounterPageState createState() => CounterPageState();
}

class CounterPageState extends State<CounterPage>{
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('計數器'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.west),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
        ],
      ),
      body: Center(child: Text('計數秒數: $counter'),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(counter < 10){
            setState(() {
              counter++;
            });
          }
          else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('計時已開始')));
            setState(() {
              counter = 0;
            });
          }
        },
        child: Icon(Icons.timer),
      ),
    );
  }

}