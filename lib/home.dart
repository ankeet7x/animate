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
        appBar: new AppBar(),
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
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ScaleTransition(
                        scale: CurvedAnimation(
                            parent: controller, curve: Curves.fastOutSlowIn),
                        child: Icon(
                          Icons.ac_unit_sharp,
                          size: 30,
                        ))),
                Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: ScaleTransition(
                        scale: CurvedAnimation(
                            parent: controller, curve: Curves.fastOutSlowIn),
                        child: Icon(
                          Icons.ac_unit_sharp,
                          size: 30,
                        ))),
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller.forward(),
          child: Icon(Icons.add),
        ));
  }
}
