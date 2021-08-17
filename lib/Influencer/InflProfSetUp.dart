import 'package:alert/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/Influencer/InfluencerHome.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class InflProfSetUp extends StatefulWidget {
  @override
  _InflProfSetUpState createState() => _InflProfSetUpState();
}

class _InflProfSetUpState extends State<InflProfSetUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _workdoneController = TextEditingController();
  final TextEditingController _image1Controller = TextEditingController();
  final TextEditingController _image2Controller = TextEditingController();
  final TextEditingController _instaController = TextEditingController();
  final TextEditingController _fbController = TextEditingController();
  final TextEditingController _snapController = TextEditingController();
  final TextEditingController _twtController = TextEditingController();
  String dob, location, workdone, image1, image2, insta, fb, snap, twt;

  DateTime selectedDate = DateTime.now();

  submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirebaseFirestore.instance
          .collection("Influencer")
          .doc(_auth.currentUser.email)
          .set({
        "dob": dob,
        "location": location,
        "workdone": workdone,
        "insta": insta,
        "fb": fb,
        "snap": snap,
        "twt": twt,
        "email": _auth.currentUser.email,
      });
      FirebaseFirestore.instance
          .collection("Users")
          .doc(_auth.currentUser.email)
          .set({
        "image": image1,
      });
      FirebaseFirestore.instance.collection("InfluencerImages").add({
        "email": _auth.currentUser.email,
        "image": image1,
      });
      FirebaseFirestore.instance.collection("InfluencerImages").add({
        "email": _auth.currentUser.email,
        "image": image2,
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => InfluencerHome()));
      Alert(message: "Profile Updated!").show();
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2022));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      _dobController.text = picked.toString();
    }
  }

  dobchangeVal(String value) {
    dob = value;
    setState(() {});
  }

  locationchangeVal(String value) {
    location = value;
    setState(() {});
  }

  workdonechangeVal(String value) {
    workdone = value;
    setState(() {});
  }

  image1changeVal(String value) {
    image1 = value;
    setState(() {});
  }

  image2changeVal(String value) {
    image2 = value;
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

  snapchangeVal(String value) {
    snap = value;
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
                    GestureDetector(
                      onTap: () {
                        _selectDate(context);
                      },
                      child: Card(
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
                              enabled: false,
                              controller: _dobController,
                              style: GoogleFonts.spartan(
                                color: Color(0xFFBC8034),
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.cake,
                                    color: Color(0xFFD81159),
                                  ),
                                  hintStyle: GoogleFonts.spartan(
                                    color: Color(0xFFBC8034),
                                    fontSize: 17.0,
                                  ),
                                  hintText: "Time to cut the cake!",
                                  border: InputBorder.none),
                              validator: (value) {
                                if (value.length < 3) {
                                  return "Date Of Birth Cannot be less than 3 characters";
                                }
                                return null;
                              },
                              onSaved: (value) => dobchangeVal(value),
                            ),
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
                            controller: _workdoneController,
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
                                hintText: "Brands you've worked with?",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Work done can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => workdonechangeVal(value),
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
                            controller: _image1Controller,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.camera_roll,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "Fav picture link please?",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Image link can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => image1changeVal(value),
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
                            controller: _image2Controller,
                            style: GoogleFonts.spartan(
                              color: Color(0xFFBC8034),
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: InputDecoration(
                                icon: Icon(
                                  Icons.photo_camera,
                                  color: Color(0xFFD81159),
                                ),
                                hintStyle: GoogleFonts.spartan(
                                  color: Color(0xFFBC8034),
                                  fontSize: 17.0,
                                ),
                                hintText: "2nd Fav picture link please?",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Image link can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => image2changeVal(value),
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
                                hintText: "Insta-Finsta, username required",
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
                                hintText: "Is your Face a Book?",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Image link can't be less than 3 characters!";
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
                            controller: _snapController,
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
                                hintText: "Your SnapChat *wink wink*",
                                border: InputBorder.none),
                            validator: (value) {
                              if (value.length < 3) {
                                return "Snapchat link can't be less than 3 characters!";
                              }
                              return null;
                            },
                            onSaved: (value) => snapchangeVal(value),
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
