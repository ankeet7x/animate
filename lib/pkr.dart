import 'package:flutter/material.dart';

class Pokhara extends StatefulWidget {
  @override
  _PokharaState createState() => _PokharaState();
}

class _PokharaState extends State<Pokhara> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Pokhara"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [Hero(tag: 'pkr', child: Image.asset('assets/pkr.jpg'))],
        ),
      ),
    );
  }
}
