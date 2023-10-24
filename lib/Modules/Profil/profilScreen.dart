import 'package:adexcloud/Shared/Components/Component.dart';
import 'package:adexcloud/Shared/Components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/Style/Theme.dart';
import '../../Shared/Style/assets.dart';
import '../Login/Cubit/cubit.dart';
import '../Login/Cubit/states.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            return Scaffold(
              body: Column(children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  'Profil',
                  style: FontStyles.style1,
                ),
                SizedBox(
                  width: 190,
                ),
                Row(
                  children: [
                    Image.asset(Assets.photoDeProfil),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [Text('data'), Text('data')],
                    )
                  ],
                ),
                SizedBox(
                  height: 43,
                ),
                profilComp(
                    icon: Assets.profilIcon,
                    item: 'Informations générales',
                    route: '/dashboard'),
                SizedBox(
                  height: 20,
                ),
                profilComp(
                    icon: Assets.profilIcon,
                    item: 'Informations générales',
                    route: '/dashboard'),
                SizedBox(
                  height: 20,
                ),
                profilComp(
                    icon: Assets.profilIcon,
                    item: 'Informations générales',
                    route: '/dashboard'),
                SizedBox(
                  height: 20,
                ),
                profilComp(
                    icon: Assets.profilIcon,
                    item: 'Informations générales',
                    route: '/dashboard'),
                SizedBox(
                  height: 20,
                ),
                profilComp(
                    icon: Assets.profilIcon,
                    item: 'Informations générales',
                    route: '/dashboard'),
                SizedBox(
                  height: 40,
                ),
                defaultButton(
                    text: 'Confirmer',
                    function: () => cubit.signout(context))
              ]),
            );
          },
        ));
  }
}
