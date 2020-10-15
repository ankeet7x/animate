import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(),
      body: ListView(
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // image:
                    // DecorationImage(image: AssetImage('assets/pkr.jpg'))
                  ),
                  child:
                      Hero(tag: 'pkr', child: Image.asset('assets/pkr.jpg'))),
            ),
            onTap: () => Navigator.pushNamed(context, '/pkr'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Image.asset('assets/mteve.jpg'),
          )
        ],
      ),
    );
  }
}
