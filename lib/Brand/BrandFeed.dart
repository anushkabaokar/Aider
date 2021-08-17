import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/Brand/BrndInfluProf.dart';

class BrandFeed extends StatefulWidget {
  @override
  _BrandFeedState createState() => _BrandFeedState();
}

class _BrandFeedState extends State<BrandFeed> {
  Query query = FirebaseFirestore.instance.collection('Users');
  @override
  Widget build(BuildContext context) {
    return Container(
        child: StreamBuilder<QuerySnapshot>(
      stream: query.where("role", isEqualTo: 0).snapshots(),
      builder: (context, stream) {
        if (stream.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (stream.hasError) {
          return Center(child: Text(stream.error.toString()));
        }

        QuerySnapshot querySnapshot = stream.data;

        return ListView.builder(
          itemCount: querySnapshot.size,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(querySnapshot.docs[index]["name"]),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => BrndInfluProf(
                              querySnapshot.docs[index]["uid"])));
                    },
                  ),
                ),
              ),
            );
          },
        );
      },
    ));
  }
}
