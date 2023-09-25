

import 'dart:async';

import 'package:adexcloud/Modules/Login/loginScreen.dart';
import 'package:adexcloud/Shared/Style/Colors.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(milliseconds: 6000),
        () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ));
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) * (1 / 6),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(Assets.splashImage)),
            ),
          ),
          SpinKitThreeBounce(
            size: 30,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
