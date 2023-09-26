import 'package:adexcloud/Modules/Commandes/Commandes_screen.dart';
import 'package:adexcloud/Modules/Facture/Facture_screen.dart';
import 'package:adexcloud/Modules/Services/MesServices_screen.dart';
import 'package:adexcloud/Shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}
int current_index =0 ;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    List pages =[
      MesServicesScreen() ,
      MesCommandesScreen() ,
      MesFacturesScreen()
    ] ;
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
            )
          ],

        )

      ),
    );
  }
}
