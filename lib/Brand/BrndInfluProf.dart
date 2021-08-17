import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:practice/Influencer/AddInfluImages.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class BrndInfluProf extends StatefulWidget {
  String email;
  BrndInfluProf(this.email);
  @override
  _BrndInfluProfState createState() => _BrndInfluProfState();
}

class _BrndInfluProfState extends State<BrndInfluProf> {
  Query query = FirebaseFirestore.instance.collection('Influencer');

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('dd-MM-yyyy');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

  List images = [];

  @override
  void initState() {
    super.initState();
    print(widget.email);
    loadData();
  }

  loadData() {
    FirebaseFirestore.instance
        .collection("InfluencerImages")
        .where("email", isEqualTo: widget.email)
        .get()
        .then((value) {
      var data = value.docs.toList();
      for (var item in data) {
        setState(() {
          images.add(item["image"]);
        });
      }
      print(data);
      print(images);
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: query.where('email', isEqualTo: widget.email).snapshots(),
      builder: (context, stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (stream.hasError) {
          return Center(child: Text(stream.error.toString()));
        }

        QuerySnapshot querySnapshot = stream.data;
        print("Data is here");
        print(querySnapshot.docs);

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 4.0, 15.0, 4.0),
              child: Text(
                "More Details",
                style: GoogleFonts.meriendaOne(
                    fontWeight: FontWeight.w800,
                    fontSize: 27.0,
                    color: Color(0xFFE38CA5)),
              ),
            ),
          ),
          body: Container(
            color: Color(0xFFEFF1F3),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(height: 400.0),
                    items: images.map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                              ),
                              child: Image.network(i.toString()));
                        },
                      );
                    }).toList(),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/66/b2/eb/66b2eb0fbe8f96ee3c2bda40f6728f04.jpg")),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.cake,
                            size: 35.0,
                          ),
                          Text(
                            convertDateTimeDisplay(
                                querySnapshot.docs[0]['dob']),
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spartan(
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/c3/1a/68/c31a68f5f62207c0360a5210bc96744b.jpg")),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 35.0,
                          ),
                          Text(
                            querySnapshot.docs[0]['location'],
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spartan(
                                fontSize: 30.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/ad/f5/c4/adf5c405efc780b9ff08757b3e8f7145.jpg")),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.attach_money,
                            size: 40.0,
                          ),
                          Expanded(
                            child: Text(
                              querySnapshot.docs[0]['workdone'],
                              textAlign: TextAlign.center,
                              style: GoogleFonts.spartan(
                                  fontSize: 20.0, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/64/6e/66/646e66b5dd2bd91939b370fc446a405f.jpg")),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(AntDesign.instagram),
                          Text(
                            " / ${querySnapshot.docs[0]['insta']}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spartan(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/e5/90/e4/e590e498e592c1f43289857e037f3943.jpg")),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(AntDesign.facebook_square),
                          Text(
                            " / ${querySnapshot.docs[0]['fb']}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spartan(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/c0/5e/79/c05e794a995225e8674484e50137ea5b.jpg")),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(AntDesign.camerao),
                          Text(
                            " / ${querySnapshot.docs[0]['snap']}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spartan(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17.0)),
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                "https://i.pinimg.com/564x/4f/d3/f3/4fd3f307109ef56dbc19d75fe19ae243.jpg")),
                        borderRadius: BorderRadius.circular(17.0),
                      ),
                      height: 100.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(AntDesign.twitter),
                          Text(
                            " / ${querySnapshot.docs[0]['twt']}",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.spartan(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                color: Color(0xFFFFB627),
                child: Text("Connect",
                    style: GoogleFonts.poppins(
                        fontSize: 25.0,
                        color: Color(0xFF2B303A),
                        fontWeight: FontWeight.w500)),
                onPressed: () {
                },
                padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              ),
            ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
