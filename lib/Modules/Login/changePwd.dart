

import 'package:adexcloud/Modules/Login/Cubit/cubit.dart';
import 'package:adexcloud/Modules/Login/Cubit/states.dart';
import 'package:adexcloud/Modules/Login/loginScreen.dart';
import 'package:adexcloud/Shared/Components/components.dart';
import 'package:adexcloud/Shared/Style/Theme.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePwdScreen extends StatelessWidget {
  const ChangePwdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        builder: (BuildContext context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(23.0,0,0,0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Changer mot de passe',
                          style: FontStyles.style1,
                        ),
                      ],
                    ),
                    SizedBox(height: 90,),
                    Text(
                      'Adresse email',
                      style: FontStyles.style3,
                    ),
                    SizedBox(
                      width: 320,
                      child: defaultFormField(
                        hint: 'user@gmail.com',
                        prefIcon: Image.asset(Assets.profilIcon),
                        controller: cubit.emailController,
                        type: TextInputType.emailAddress,
                        validate: null,
                        ObscureText: cubit.visibilityPassword,
                      ),
                    ),
                    SizedBox(height: 49,),
                    Text(
                      'Mot de passe',
                      style: FontStyles.style3,
                    ),
                    SizedBox(
                      width: 320,
                      child: defaultFormField(
                          hint: '**********',
                          prefIcon: Image.asset(Assets.lockIcon),
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          validate: null,
                          suffIcon: Image.asset(Assets.visibilityIcon), ObscureText: true),
                    ),
                    SizedBox(height: 49,),
                    Text(
                      'Confirmer le mot de passe',
                      style: FontStyles.style3,
                    ),
                    SizedBox(
                      width: 320,
                      child: defaultFormField(
                          hint: '**********',
                          prefIcon: Image.asset(Assets.lockIcon),
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          validate: null,
                          suffIcon: Image.asset(Assets.visibilityIcon), ObscureText: true),
                    ),
                    SizedBox(height: 96,),
                    defaultButton(
                        text: 'Confirmer',
                        function: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  LoginScreen()),
                        )),
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
