import 'package:adexcloud/Shared/Components/components.dart';
import 'package:adexcloud/Shared/Style/Theme.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              iconButton(label: Image.asset(Assets.goBackIcon), function:()=>Navigator.pop(context)),
              Text(
                'Notifications',
                style: FontStyles.style1,
              ),

            ],
          ),
          SizedBox(height:45,),
         /* ListView.builder(

              itemBuilder: itemBuilder
          )*/
        ],
      ),
    );
  }
}
