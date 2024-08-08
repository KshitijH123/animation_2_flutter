import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation colorAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10));
    animation = Tween(begin: 0.0, end: 300.0).animate(animationController);
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.grey)
        .animate(animationController);

    animationController.addListener(() {
      print(animation.value);

      setState(() {});
    });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tween'),
      ),
      body: Center(
        child: Container(
          width: animation.value,
          height: animation.value,
          color: colorAnimation.value,
          child: Icon(Icons.lock_rounded),
        ),
      ),
    );
  }
}
