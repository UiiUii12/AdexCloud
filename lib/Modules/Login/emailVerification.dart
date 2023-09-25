

import 'package:adexcloud/Modules/Login/Cubit/cubit.dart';
import 'package:adexcloud/Modules/Login/Cubit/states.dart';
import 'package:adexcloud/Shared/Style/Theme.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        builder: (BuildContext context, state) {
         // var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(23.0, 0,23, 0,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: null,
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset(Assets.goBackIcon)),
                        ),
                        Text(
                          'Mot de passe oublié',
                          style: FontStyles.style1,
                        ),
                      ],
                    ),
                    SizedBox(height: 90,),
                    SizedBox(
                        height:166,
                        width:222,
                        child: Lottie.asset(Assets.mailSent)),
                    SizedBox(height: 90,),
                    Text(
                      textAlign:TextAlign.center,
                      'Nous vous avons envoyé par email le lien de réinitialisation du mot de passe !',
                      style: FontStyles.style2,
                    ),
                    SizedBox(
                      height: 50,
                    )
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
