import 'package:alert/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:practice/Influencer/InfluencerHome.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class AddInfluImages extends StatefulWidget {
  @override
  _AddInfluImagesState createState() => _AddInfluImagesState();
}

class _AddInfluImagesState extends State<AddInfluImages> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _imageController = TextEditingController();
  String image;

  DateTime selectedDate = DateTime.now();

  submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FirebaseFirestore.instance.collection("InfluencerImages").add({
        "email": _auth.currentUser.email,
        "image": image,
      });
      Navigator.of(context).pop();
      Alert(message: "Profile Updated!").show();
    }
  }

  imagechangeVal(String value) {
    image = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Change up your profile!",
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
            Form(
              key: _formKey,
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
                      controller: _imageController,
                      style: GoogleFonts.spartan(
                        color: Color(0xFFBC8034),
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.camera,
                            color: Color(0xFFD81159),
                          ),
                          hintStyle: GoogleFonts.spartan(
                            color: Color(0xFFBC8034),
                            fontSize: 17.0,
                          ),
                          hintText: "Add more images!",
                          border: InputBorder.none),
                      validator: (value) {
                        if (value.length < 3) {
                          return "Image Link can't be less than 3 characters!";
                        }
                        return null;
                      },
                      onSaved: (value) => imagechangeVal(value),
                    ),
                  ),
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
