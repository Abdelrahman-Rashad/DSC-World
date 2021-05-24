import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:world/pages/appbar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool mode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'world',
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          children: [],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(0),
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0)),
                    image: DecorationImage(
                      image: AssetImage('image/world-tour.png'),
                      fit: BoxFit.fitHeight,
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Welcome',
                        style: GoogleFonts.ubuntu(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600),
                        )),
                  ],
                )),
            ListTile(
              title: Text('Dark Mode'),
              leading: Switch(
                value: mode,
                onChanged: (value) {
                  setState(() {
                    mode = value;
                  });
                },
                activeTrackColor: Colors.greenAccent,
                activeColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
