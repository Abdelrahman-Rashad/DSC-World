import 'package:flutter/material.dart';
import 'package:world/pages/favorite.dart';
import 'package:world/pages/home.dart';

class Bottomapp extends StatefulWidget {
  @override
  _BottomappState createState() => _BottomappState();
}

class _BottomappState extends State<Bottomapp> {
  int currentindex = 0;
  final List<Widget> taps = [Home(), Favorite()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: taps[currentindex],
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          currentIndex: currentindex,
          backgroundColor: Colors.teal,
          selectedItemColor: Colors.greenAccent,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined),
              label: 'Favorite',
            )
          ],
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
        ),
      ),
    );
  }
}
