import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  final String title;
  HomePage({Key? key, required this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: AnimatePage(),
    );
  }
  
}

class AnimatePage extends StatefulWidget {
  AnimatePage({Key? key}) : super(key: key);

  @override
  _AnimatePageState createState() => _AnimatePageState();
}

class _AnimatePageState extends State<AnimatePage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        controller.reverse();
      }
      else if(status == AnimationStatus.dismissed){
        controller.forward();
      }
      //print('$status');
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation,);
}

class AnimatedLogo extends AnimatedWidget{
  static final opacity = Tween<double>(begin: 0.1, end: 1);
  static final size = Tween<double>(begin: 0, end: 300);
  AnimatedLogo({Key? key, required Animation<double> animation}) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;

    return Center(
      child: Opacity(
        opacity: opacity.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: size.evaluate(animation),
          height: size.evaluate(animation),//animation.value,
          child: const FlutterLogo(),
        ),
      ),
    );
  }

}

class GrowTransition extends StatelessWidget{
  final Widget child;
  final Animation<double> animation;
  GrowTransition({required this.child, required this.animation, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child){
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }

}

class LogoWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const FlutterLogo(),
    );
  }

}