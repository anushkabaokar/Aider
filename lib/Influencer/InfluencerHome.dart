import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practice/Influencer/InfluencerProfile.dart';
import 'package:practice/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class InfluencerHome extends StatefulWidget {
  @override
  _InfluencerHomeState createState() => _InfluencerHomeState();
}

class _InfluencerHomeState extends State<InfluencerHome> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: optionStyle,
    ),
    Text(
      'Likes',
      style: optionStyle,
    ),
    Text(
      'Search',
      style: optionStyle,
    ),
    InfluencerProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 4.0, 15.0, 4.0),
          child: Text(
            "Influencer",
            style: GoogleFonts.meriendaOne(
                fontWeight: FontWeight.w800,
                fontSize: 27.0,
                color: Color(0xFFE38CA5)),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.person_outline,
              color: Color(0xFFFFB627),
              size: 30.0,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => InfluencerProfile()));
            },
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Color(0xFFFFB627),
              size: 30.0,
            ),
            onPressed: () {
              _auth.signOut();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => SplashScreen()));
            },
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Color(0xFF2B303A), boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 8,
                activeColor: Color(0xFF2B303A),
                iconSize: 24,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Color(0xFFFFB627),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                    iconColor: Color(0xFFFFB627),
                  ),
                  GButton(
                    icon: Icons.filter_frames,
                    text: 'Likes',
                    iconColor: Color(0xFFFFB627),
                  ),
                  GButton(
                    icon: Icons.search,
                    text: 'Search',
                    iconColor: Color(0xFFFFB627),
                  ),
                  GButton(
                    icon: Icons.person_outline,
                    text: 'Profile',
                    iconColor: Color(0xFFFFB627),
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}
