import 'package:flutter/material.dart';
import 'package:practice/SplashScreen.dart';
import 'package:practice/details.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Practice"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.power),onPressed: (){
              _auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>SplashScreen()));
            },)
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Details()));
                },
                child: Card(
                    elevation: 5.0,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image(
                              image: NetworkImage(
                                  "https://images.unsplash.com/photo-1612454880232-826d7d321cac?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=700&q=80"),
                            ),
                          ),
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Name: Nitish Patel",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30.0),
                            ),
                            Text(
                              "Description: Something",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15.0),
                            )
                          ],
                        )
                      ],
                    )),
              ),
            )
          ],
        ));
  }
}