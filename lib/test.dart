import 'dart:ui';

import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.network(
            "https://www.logodesign.net/images/illustration-logo.png",
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              color: Colors.grey.withOpacity(0.1),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 120.0,
            child: Text(
              "Kuch Bhi",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}