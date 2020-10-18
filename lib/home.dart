import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double opacityLevel = 0.1;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 0.1 : 1.0);
  }

  bool first = true;
  Color textColor = Colors.yellow;
  double textSize = 30;
  FontWeight textWeight = FontWeight.normal;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));

    // controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(title: Text("Animate XD")),
        body: ListView(
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: RotationTransition(
                  turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                  child: Container(
                      child: Hero(
                          tag: 'pkr', child: Image.asset('assets/pkr.jpg'))),
                ),
              ),
              onTap: () => Navigator.pushNamed(context, '/pkr'),
            ),
            Row(
              children: [
                AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: Duration(seconds: 2),
                    child: FlutterLogo()),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ScaleTransition(
                        scale: CurvedAnimation(
                            parent: controller, curve: Curves.fastOutSlowIn),
                        child: FlutterLogo())),
              ],
            ),
            Container(
              height: 200,
              child: AnimatedDefaultTextStyle(
                  duration: Duration(seconds: 2),
                  style: TextStyle(
                      color: textColor,
                      fontSize: textSize,
                      fontWeight: textWeight),
                  child: Text(
                    "Flutter",
                  )),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.forward();
            _changeOpacity();
            setState(() {
              first = !first;
              textColor = first ? Colors.yellow : Colors.pink;
              textWeight = first ? FontWeight.normal : FontWeight.bold;
              textSize = first ? 30 : 60;
            });
          },
          child: Icon(Icons.add),
        ));
  }
}
