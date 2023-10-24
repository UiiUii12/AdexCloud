import 'dart:ui';
import 'dart:ui';

import 'package:adexcloud/Modules/Commandes/Commandes_screen.dart';
import 'package:adexcloud/Modules/Facture/Facture_screen.dart';
import 'package:adexcloud/Modules/Profil/profilScreen.dart';
import 'package:adexcloud/Modules/Services/MesServices_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Shared/Components/components.dart';
import '../Shared/Style/assets.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
int current_index =0 ;
final defaultColor =Color(0XFF566ACC) ;
class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    List pages =[
      MesServicesScreen() ,
      MesCommandesScreen() ,
      MesFacturesScreen(),
      ProfilScreen()
    ] ;
    return BlocProvider(
      create: ( context) => LayoutCubit() ..GetServices() ..GetCommandes() ..GetFactures()  ,

      child: BlocConsumer<LayoutCubit , LayoutStates>(
        builder: (context ,state) {
          return SafeArea(
            child: Scaffold(

              body: pages[current_index],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: current_index,
                unselectedItemColor :Color(0xff7E8AA2),
                selectedItemColor : defaultColor ,
                onTap:(int index){
                  setState(() {
                    current_index =index ;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.grid_view_outlined, size: 18, color :Color(0xff7E8AA2),) ,
                      activeIcon: Icon(Icons.grid_view_outlined, size: 18, color :defaultColor,) ,
                      label: "Services"
                  ) ,
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart ,  size: 18, color:Color(0xff7E8AA2),) ,
                      activeIcon: Icon(Icons.shopping_cart ,  size: 18, color:defaultColor,) ,
                    label: "Commandes"
                  ) ,
                  BottomNavigationBarItem(
                      icon: Icon(Icons.paid_outlined,  size: 18, color:Color(0xff7E8AA2),) ,
                      activeIcon: Icon(Icons.paid_outlined ,  size: 18, color:defaultColor,) ,
                      label: "Facture"
                  ),
                  BottomNavigationBarItem(
                      icon: Image.asset(Assets.profilIcon,),
                      activeIcon: Image.asset(Assets.profilIcon,),
                      label: "Profile"
                  ),

                ],

              )

            ),
          );
        }, listener: (BuildContext context, state) {  },
      ),
    );
  }
}
