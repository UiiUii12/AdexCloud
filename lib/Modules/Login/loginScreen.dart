

import 'package:adexcloud/Modules/Login/Cubit/cubit.dart';
import 'package:adexcloud/Modules/Login/Cubit/states.dart';
import 'package:adexcloud/Shared/Components/components.dart';
import 'package:adexcloud/Shared/Style/Theme.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

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
                      height: 79,
                    ),
                    Text(
                      'Connectez-vous',
                      style: FontStyles.style1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'Connectez-vous rapidement et en toute sécurité pour accéder à votre compte.',
                        style: FontStyles.style2,),
                    SizedBox(
                      height: 60,
                    ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            iconButton(
                              label: Text('Mot de passe oublié ?',style:FontStyles.style5),
                              function:()=>  cubit.ChangePassword()),
                            SizedBox(width: 40,)
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        defaultButton(
                            text: 'Se connecter',
                            function: () => {
                              cubit.login(
                                  context),
                            }
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
