import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: GoogleFonts.montserrat(),),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          CarouselSlider(
  options: CarouselOptions(height: 400.0),
  items: ["https://images.unsplash.com/photo-1616697256726-b5b7888a7a4a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=700&q=80","https://images.unsplash.com/photo-1616698566435-1b88f2028e2c?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=700&q=80","https://images.unsplash.com/photo-1616696826480-73000649a945?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=700&q=80"].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          child: Image.network(i)
        );
      },
    );
  }).toList(),
),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person_outline,
                    size: 30.0,
                    color: Colors.deepPurple,
                  ),
                ),
                Text("Nitish Patel",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 25.0)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.pie_chart,
                    size: 30.0,
                    color: Colors.deepPurple,
                  ),
                ),
                Text("21",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 25.0)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.location_city,
                    size: 30.0,
                    color: Colors.deepPurple,
                  ),
                ),
                Text("Jaipur",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold, fontSize: 25.0)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text("Work done",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold, fontSize: 25.0)),
            ),
          ),
          Container(
            height: 150.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Brand(
                    "https://i.pinimg.com/originals/9c/76/a8/9c76a82615aae4ca65e1efee25f05608.png"),
                Brand(
                    "https://cdn.logojoy.com/wp-content/uploads/2018/05/30143359/2_big1.png"),
                Brand(
                    "https://wwd.com/wp-content/uploads/2018/09/logo_celine_jpeg1.jpg"),
                Brand(
                    "https://i.pinimg.com/originals/9c/76/a8/9c76a82615aae4ca65e1efee25f05608.png"),
                Brand(
                    "https://cdn.logojoy.com/wp-content/uploads/2018/05/30143359/2_big1.png"),
                Brand(
                    "https://wwd.com/wp-content/uploads/2018/09/logo_celine_jpeg1.jpg"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Brand extends StatelessWidget {
  String image;
  Brand(this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        elevation: 5.0,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 80.0,
          child: ClipOval(
            child: Image.network(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
