import 'package:adexcloud/Shared/Components/Component.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController() ;
    final fromKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key:fromKey ,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left:12),
            child: Column(
              children: [
                Text(
                    "Connectez-vous" ,
                  style: TextStyle(
                    fontSize: 20 ,
                    color: Colors.black ,
                  ),
                ) ,
                SizedBox(height: 34,) ,
                Text(
                  "Connectez-vous rapidement et en toute sécurité pour accéder à votre compte." ,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14 ,
                    color: Color(0xff)
                  ),
                ),
                defaultTextField(
                    controller:controller,
                    type: TextInputType.text,
                    hint : "entrer le nom" ,
                    validate: (value ) {
                      if(value!.isEmpty) {
                        return "Ce champ est obligatoire" ;
                      }

                }

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
