import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class BrandProfile extends StatefulWidget {
  @override
  _BrandProfileState createState() => _BrandProfileState();
}

class _BrandProfileState extends State<BrandProfile> {
  Query query = FirebaseFirestore.instance.collection('Brand');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream:
          query.where('email', isEqualTo: _auth.currentUser.email).snapshots(),
      builder: (context, stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (stream.hasError) {
          return Center(child: Text(stream.error.toString()));
        }

        QuerySnapshot querySnapshot = stream.data;
        print(querySnapshot.docs);

        return Scaffold(
          body: Container(
            color: Color(0xFFEFF1F3),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: <Widget>[
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(140.0)),
                    child: Container(
                      height: 150.0,
                      child: Row(
                        children: <Widget>[
                          Image(
                            width: MediaQuery.of(context).size.width*0.8,
                            image: NetworkImage(querySnapshot.docs[0]["logo"]),
                          )
                        ],
                        mainAxisAlignment: MainAxisAlignment.center,
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
                            AntDesign.profile,
                            size: 35.0,
                          ),
                          Text(
                            querySnapshot.docs[0]['brndname'],
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
                          Icon(AntDesign.youtube),
                          Text(
                            " / ${querySnapshot.docs[0]['yt']}",
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
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// class InfluImages extends StatefulWidget {
//   @override
//   _InfluImagesState createState() => _InfluImagesState();
// }

// class _InfluImagesState extends State<InfluImages> {
//   Query query = FirebaseFirestore.instance.collection('InfluencerImages');

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: query
//                               .where('email', isEqualTo: _auth.currentUser.email)
//                               .snapshots(),
//       builder: (context, stream) {
//         if (stream.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }

//         if (stream.hasError) {
//           return Center(child: Text(stream.error.toString()));
//         }

//         QuerySnapshot querySnapshot = stream.data;
//         print(querySnapshot.docs);

//         return CarouselSlider(
//   options: CarouselOptions(height: 400.0),
//   items: [querySnapshot.docs.map((e) => e)].map((i) {
//     return Builder(
//       builder: (BuildContext context) {
//         return Container(
//           width: MediaQuery.of(context).size.width,
//           margin: EdgeInsets.symmetric(horizontal: 5.0),
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//           ),
//           child: Image.network(i.)
//         );
//       },
//     );
//   }).toList(),
// ),
//       },
//     );
//   }
// }
