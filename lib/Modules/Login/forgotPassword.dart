

import 'package:adexcloud/Modules/Login/Cubit/cubit.dart';
import 'package:adexcloud/Modules/Login/Cubit/states.dart';
import 'package:adexcloud/Modules/Login/emailVerification.dart';
import 'package:adexcloud/Shared/Components/components.dart';
import 'package:adexcloud/Shared/Style/Theme.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPwdScreen extends StatelessWidget {
  const ForgotPwdScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(23.0, 0, 0, 0),
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
                          'Mot de passe oublié',
                          style: FontStyles.style1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Un email de confirmation a été envoyé à votre adresse pour finaliser le changement de mot de passe.',
                      style: FontStyles.style2,
                    ),
                    SizedBox(
                      height: 40,
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
                    SizedBox(
                      height: 49,
                    ),
                    defaultButton(
                        text: 'Réinitialiser',
                        function: () =>
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      EmailVerificationScreen()),
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
      ),
    );
  }
}
