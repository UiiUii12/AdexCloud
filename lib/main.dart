

import 'package:adexcloud/Modules/Dashboard/DashboardScreen.dart';
import 'package:adexcloud/Modules/Login/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Modules/Login/splashScreen.dart';
import 'Modules/Notifications/Notifications.dart';


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Adex Cloud',
      initialRoute:'/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/dashboard': (context) => DashboardScreen(),
        '/notifications':(context)=>NotificationsScreen(),
      },
    );
  }
}


