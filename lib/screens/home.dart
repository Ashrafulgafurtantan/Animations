import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  buildAnimation(){
    return Container(
      height: 200,
      width: 200,
      decoration: new BoxDecoration(
          image: new DecorationImage(
            image: AssetImage('assets/images/cat.png'),
            fit: BoxFit.contain,
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Animation')),

      ),
      body: buildAnimation(),
    );
  }
}
