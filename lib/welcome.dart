import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/SignUp.dart';
import 'package:practice/login.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color(0xFF2B303A)),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Card(
                color: Color(0xFF2B303A),
                elevation: 0.0,
                child: Image(
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage("assets/logoaider.png"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/ec/1d/8d/ec1d8d68f5a0968f3be0d6bc5cf545e0.jpg"),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Influencer",
                          style: GoogleFonts.bangers(
                              fontSize: 50.0, ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            "Time to influence the world, Poo style!",
                            style: GoogleFonts.poppins(fontSize: 25.0, fontWeight: FontWeight.w600,),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Card(
                child: Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/7f/7c/4b/7f7c4ba4940ed9b12589948c0e14af7c.jpg"),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Text(
                          "Brand",
                          style: GoogleFonts.bangers(
                              fontSize: 50.0,),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "For people to see, you need people to show!",
                            style: GoogleFonts.poppins(fontSize: 25.0, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                          color: Color(0xFFE38CA5),
                          child: Text("Influencer SignUp",
                              style: GoogleFonts.poppins(
                                  fontSize: 18.0, color: Color(0xFF2B303A), fontWeight: FontWeight.w600)),
                          onPressed: () {
                            Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (BuildContext context) => SignUp(false)));
                          },
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)),
                        ),
                      FlatButton(
                        color: Color(0xFF87D4CA),
                        child: Text("Brand SignUp",
                            style: GoogleFonts.poppins(
                                fontSize: 18.0, color: Color(0xFF2B303A), fontWeight: FontWeight.w600)),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                              builder: (BuildContext context) => SignUp(true)));
                        },
                        padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                      ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  color: Color(0xFF2B303A),
                  child: Text("Log In",
                      style: GoogleFonts.poppins(
                          fontSize: 25.0, color: Color(0xFFFFB627), fontWeight: FontWeight.w500)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => Login()));
                  },
                  padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                ),
              ],
            ),
            SizedBox(height: 20.0,)
          ],
        ),
      ),
    );
  }
}
