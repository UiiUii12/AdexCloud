

import 'package:adexcloud/Modules/Dashboard/Cubit/cubit.dart';
import 'package:adexcloud/Modules/Dashboard/Cubit/states.dart';
import 'package:adexcloud/Shared/Components/components.dart';
import 'package:adexcloud/Shared/Style/Colors.dart';
import 'package:adexcloud/Shared/Style/Theme.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:adexcloud/Shared/Style/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocConsumer<DashboardCubit, DashboardStates>(
        builder: (BuildContext context, state) {
          //var cubit = DashboardCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(23.0, 0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'Dashboard',
                          style: FontStyles.style1,
                        ),
                        SizedBox(
                          width: 190,
                        ),
                        iconButton(
                            label: Image.asset(Assets.notificationsIcon),
                            function: () async {
                              Navigator.pushReplacementNamed(context, AppRoute.profilScreen);
                             }
                              ),
                      ],
                    ),
                    SizedBox(
                      height: 36,
                    ),
                    Text(
                      'Récapitulatif',
                      style: FontStyles.style3,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    Row(children: [
                      dashboardItem(color: myCreditItem, icon: Assets.creditIcon, title: 'Mon crédit', contenu: '${0.00} DZ'),
                    ],),
                    Text(
                      'Mes Commandes',
                      style: FontStyles.style3,
                    ),
                    Text(
                      'Mon Support',
                      style: FontStyles.style3,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        listener: (BuildContext context, state) {},
      ),
    );
  }
}
