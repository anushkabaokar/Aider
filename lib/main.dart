import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice/Influencer/InflProfSetUp.dart';
import 'package:practice/SplashScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PracticeApp",
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Color(0xFF2B303A),
        highlightColor: Color(0xFFEE6055),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
