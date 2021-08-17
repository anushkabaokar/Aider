import 'package:alert/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/Brand/BrandHome.dart';
import 'package:practice/Influencer/InfluencerHome.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class BrndProfSetUp extends StatefulWidget {
  @override
  _BrndProfSetUpState createState() => _BrndProfSetUpState();
}

class _BrndProfSetUpState extends State<BrndProfSetUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _logoController = TextEditingController();
  final TextEditingController _brndnameController = TextEditingController();
  final TextEditingController _instaController = TextEditingController();
  final TextEditingController _ytController = TextEditingController();
  final TextEditingController _fbController = TextEditingController();
  final TextEditingController _twtController = TextEditingController();
  String location, logo, brndname, yt, fb, insta, twt;

  submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirebaseFirestore.instance
          .collection("Brand")
          .doc(_auth.currentUser.email)
          .set({
        "logo": logo,
        "location": location,
        "brndname": brndname,
        "insta": insta,
        "fb": fb,
        "yt": yt,
        "twt": twt,
        "email": _auth.currentUser.email,
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => BrandHome()));
      Alert(message: "Profile Updated!").show();
    }
  }

  logochangeVal(String value) {
    logo = value;
    setState(() {});
  }

  locationchangeVal(String value) {
    location = value;
    setState(() {});
  }

  brndnamechangeVal(String value) {
    brndname = value;
    setState(() {});
  }

  instachangeVal(String value) {
    insta = value;
    setState(() {});
  }

  fbchangeVal(String value) {
    fb = value;
    setState(() {});
  }

  ytchangeVal(String value) {
    yt = value;
    setState(() {});
  }

  twtchangeVal(String value) {
    twt = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Set up your profile!",
          style: GoogleFonts.quicksand(
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
              color: Color(0xFFFFB627)),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Color(0xFFEADEDA)),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      color: Color(0xFF2B303A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFF2B303A), width: 1.0))),
                          child: TextFormField(
                            controller: _brndnameController,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.location_on,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "Brand Name, please?",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Brand Name cannot be less than 3 characters";
                              }
                              return null;
                            },
                            onSaved: (value) => brndnamechangeVal(value),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2B303A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFF2B303A), width: 1.0))),
                          child: TextFormField(
                            controller: _locationController,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.location_on,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "City, Please?",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Location cannot be less than 3 characters";
                              }
                              return null;
                            },
                            onSaved: (value) => locationchangeVal(value),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2B303A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFF2B303A), width: 1.0))),
                          child: TextFormField(
                            controller: _logoController,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.work,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "Your logo link is our boon",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Logo link can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => logochangeVal(value),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2B303A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFF2B303A), width: 1.0))),
                          child: TextFormField(
                            controller: _instaController,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  AntDesign.instagram,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "Instagram username required",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Instagram link can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => instachangeVal(value),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2B303A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFF2B303A), width: 1.0))),
                          child: TextFormField(
                            controller: _fbController,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  AntDesign.facebook_square,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "Is your Face a Book? Username pls?",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Facebook username can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => fbchangeVal(value),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2B303A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFF2B303A), width: 1.0))),
                          child: TextFormField(
                            controller: _ytController,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  AntDesign.camerao,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "Youtube Account?",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Youtube link can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => ytchangeVal(value),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Color(0xFF2B303A),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Color(0xFF2B303A), width: 1.0))),
                          child: TextFormField(
                            controller: _twtController,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  AntDesign.twitter,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "Tweetie birdie",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Twitter link can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => twtchangeVal(value),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                color: Color(0xFFFFB627),
                child: Text("Submit",
                    style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        color: Color(0xFF2B303A),
                        fontWeight: FontWeight.w500)),
                onPressed: () {
                  submit();
                },
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
