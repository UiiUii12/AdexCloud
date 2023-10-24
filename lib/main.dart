

import 'package:adexcloud/Layout/MainScreen.dart';
import 'package:adexcloud/Layout/cubit/cubit.dart';
import 'package:adexcloud/Layout/cubit/states.dart';
import 'package:adexcloud/Modules/Dashboard/DashboardScreen.dart';
import 'package:adexcloud/Modules/Login/splashScreen.dart';
import 'package:adexcloud/Modules/Notifications/Notifications.dart';
import 'package:adexcloud/Modules/Profil/profilScreen.dart';
import 'package:adexcloud/Shared/bloc_observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Modules/Login/loginScreen.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
    title: 'Adex Cloud',
    initialRoute:'/splash',
routes: {
'/splash': (context) => SplashScreen(),
'/login': (context) => LoginScreen(),
'/dashboard': (context) => DashboardScreen(),
'/notifications':(context)=>NotificationsScreen(),
  '/layout':(context)=>MainScreen(),
  '/profil':(context)=>ProfilScreen(),
},
      home: SplashScreen(),
    );
  }
}



