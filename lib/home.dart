import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: ListView(
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: RotationTransition(
                turns: Tween(begin: 0.1, end: 2.0).animate(controller),
                child: Container(
                    child:
                        Hero(tag: 'pkr', child: Image.asset('assets/pkr.jpg'))),
              ),
            ),
            onTap: () => Navigator.pushNamed(context, '/pkr'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Image.asset('assets/mteve.jpg'),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.star),
      //   onPressed: () => controller.forward(),
      // ),
    );
  }
}
