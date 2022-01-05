import 'package:flutter/material.dart';

class WeatherPage extends StatefulWidget{

  @override
  WeatherPageState createState() => WeatherPageState();
}

class WeatherPageState extends State<WeatherPage>{
  int onTapIndex = 0;
  List<String> weatherList = ['Sunny', 'Rainy', 'Snow', 'Cloud'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('天氣動畫'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Today\' weather is ${weatherList.elementAt(onTapIndex)}', style: TextStyle(fontSize: 24),),
            buildImageWidget(onTapIndex),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          buildNavigationBarElement(Icons.wb_sunny_outlined, 'sun'),
          buildNavigationBarElement(Icons.umbrella_outlined, 'rain'),
          buildNavigationBarElement(Icons.error_outline, 'snow'),
          buildNavigationBarElement(Icons.cloud_outlined, 'wind'),
        ],
        currentIndex: onTapIndex,
        onTap: (index){
          setState(() {
            onTapIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem buildNavigationBarElement(IconData iconData, String label){
    return BottomNavigationBarItem(icon: Icon(iconData), label: label, backgroundColor: Colors.deepPurple, tooltip: label);
  }
  Widget buildImageWidget(int index){
    switch(index){
      case 0:
        return Image.network('https://media.giphy.com/media/Q5jq8b6BvEtjbcXhlg/giphy.gif');
      case 1:
        return Image.network('https://media.giphy.com/media/xUOwGoNa2uX6M170d2/giphy.gif');
      case 2:
        return Image.network('https://media.giphy.com/media/5AbWXWr67pV6y8OhR0/giphy.gif');
      case 3:
        return Image.network('https://media.giphy.com/media/fYTUarigdyZyvwFQsU/giphy.gif');
      default:
        return Icon(Icons.warning_amber_outlined, color: Colors.red, size: 60,);
    }
  }

}