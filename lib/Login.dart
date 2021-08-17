import 'package:alert/alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/Brand/BrandHome.dart';
import 'package:practice/Influencer/InfluencerHome.dart';
import 'package:practice/homepage.dart';
import 'package:practice/welcome.dart';
import 'package:practice/authentication.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String email, pass;

submit() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(email);
      print(pass);
      AuthenticationService auth = AuthenticationService(_auth);
      var id = await auth.signIn(email: email, password: pass);
      if (id == email) {
        _emailController.text = "";
        _passwordController.text = "";
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
        Alert(message: id, shortDuration: false).show();
      }
    }
  }

  

  emailchangeVal(String value) {
    email = value;
    setState(() {});
  }

  passchangeVal(String value) {
    pass = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text("Login",
            style: GoogleFonts.poppins(
              fontSize: 30.0,
            )),
        backgroundColor: Color(0xFFFFE2D1),
      ),
      body: WillPopScope(
        onWillPop: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (BuildContext context) => Welcome()));
        },
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFFFE2D1)),
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                        color: Color(0xFF2B303A),
                      ),
                    ),
                    Text(
                      "Back!",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                        color: Color(0xFF2B303A),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                     
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xFF2B303A), width: 3.0))),
                        child: TextFormField(
                          controller: _emailController,
                          style: GoogleFonts.poppins(
                            color: Color(0xFF2B303A),
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: InputDecoration(
                              labelStyle:
                                  GoogleFonts.poppins(color: Color(0xFFAA1155)),
                              labelText: "Email",
                              border: InputBorder.none),
                          validator: (value) {
                            if (value.length < 3) {
                              return "Email cannot be less than 3 characters";
                            }
                            return null;
                          },
                          onSaved: (value)=>emailchangeVal(value),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Color(0xFF2B303A), width: 3.0))),
                        child: TextFormField(
                          controller: _passwordController,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2B303A),
                          ),
                          obscureText: true,
                          validator: (value) {
                            if (value.length < 6) {
                              return "Password Cannot be less than 6 characters";
                            }
                            return null;
                          },
                          onSaved: (value)=>passchangeVal(value),
                          decoration: InputDecoration(
                              labelStyle: GoogleFonts.poppins(
                                color: Color(0xFFAA1155),
                              ),
                              labelText: "Password",
                              border: InputBorder.none),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 30.0,
                        color: Color(0xFF2B303A),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Color(0xFF2B303A),
                      radius: 30.0,
                      child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Color(0xFFAA1155),
                          ),
                          onPressed: submit),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
