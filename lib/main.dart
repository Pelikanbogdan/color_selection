import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software Test Task',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const int _colorRange = 256;
  static const String _centeredTextValue = 'Hey there';
  Color _randomColor = Color(0xFFFFFFFF);

  void _setColor() {
    setState(() {
      _randomColor = Color.fromARGB(
          Random().nextInt(_colorRange),
          Random().nextInt(_colorRange),
          Random().nextInt(_colorRange),
          Random().nextInt(_colorRange));
    });
  }

  Color _selectTextColor(Color color) {
    return _randomColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _randomColor,
      body: InkWell(
        onTap: _setColor,
        child: Center(
          child: Text(
            _centeredTextValue,
            style: TextStyle(
              color: _selectTextColor(_randomColor),
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
