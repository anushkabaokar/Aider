import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practice/Brand/BrandHome.dart';
import 'package:practice/Influencer/InfluencerHome.dart';
import 'package:practice/homepage.dart';
import 'package:practice/welcome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color(0xFF2B303A)),
      child: Center(
          child: Container(
        child: Image.asset(
          "assets/logoaider.png",
          width: 300.0,
          height: 300.0,
          filterQuality: FilterQuality.high,
        ),
      )),
    );
  }

  void onDoneLoading() {
   if (_auth.currentUser != null) {
      FirebaseFirestore.instance
          .collection('Users')
          .doc(_auth.currentUser.email)
          .get()
          .then((doc) {
        var userdata = doc.data();
        if (userdata['role'] == 0) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) {
            return InfluencerHome();
          }));
        } else {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) {
            return BrandHome();
          }));
        }
      });
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Welcome()));
    }
  }
}
