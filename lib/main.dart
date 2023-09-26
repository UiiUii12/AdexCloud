import 'package:adexcloud/Layout/MainScreen.dart';
import 'package:adexcloud/Layout/cubit/cubit.dart';
import 'package:adexcloud/Layout/cubit/states.dart';
import 'package:adexcloud/Shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ( context) => LayoutCubit()..GetServices() ..GetCommandes() ..GetFactures() ,
       // ..Login(),
      child: BlocConsumer<LayoutCubit , LayoutStates>(
        builder: (context ,state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              useMaterial3: true,
            ),
            home: MainScreen(),
          );
        }, listener: (BuildContext context,  state) {  },
      ),
    );
  }
}

