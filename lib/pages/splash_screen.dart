import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:world/pages/appbar.dart';
import 'package:world/pages/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: Bottomapp(),
      duration: 3000,
      imageSize: 200,
      imageSrc: "image/share.png",
      backgroundColor: Colors.white,
    );
  }
}
