

import 'dart:async';

import 'package:adexcloud/Layout/MainScreen.dart';
import 'package:adexcloud/Shared/Style/Colors.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Shared/Style/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    checkAuthAndNavigate();
  }
  ///////////////////////////////////////////////////////////
  Future<void> checkAuthAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final authToken = prefs.getString('token');

    if (authToken != null) {
      // User is already authenticated, navigate to home screen.
      Navigator.pushReplacementNamed(context, '/layout');
    } else {
      // User is not authenticated, navigate to login screen.
      Navigator.pushReplacementNamed(context, AppRoute.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
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
