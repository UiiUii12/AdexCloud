import 'package:adexcloud/Modules/Services/MesServices_screen.dart';
import 'package:adexcloud/Shared/bloc_observer.dart';
import 'package:adexcloud/cubit/cubit.dart';
import 'package:adexcloud/cubit/states.dart';
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
      create: ( context) => GlobalCubit()..GetServices(),
      child: BlocConsumer<GlobalCubit , GlobalStates>(
        builder: (context ,state) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(

              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: MesServicesScreen(),
          );
        }, listener: (BuildContext context,  state) {  },
      ),
    );
  }
}

