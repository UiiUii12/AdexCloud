
import 'package:adexcloud/Modules/Dashboard/DashboardScreen.dart';
import 'package:adexcloud/Shared/Network/Endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:adexcloud/Modules/Login/Cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailController=new TextEditingController() ;
  TextEditingController passwordController=new TextEditingController() ;
  final formKey = GlobalKey<FormState>();
  bool visibilityPassword=false;
  void login(String email,String password,BuildContext context) async{
    try{
      Response response = await post(
          Uri.parse(Global_url+Login),
          body: {
            'email' : email,
            'password' : password
          }
      );
      if(response.statusCode==201){
       // var data=jsonDecode(response.body.toString());
        //print(data['token']);
       // print('Login successfully');
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DashboardScreen()));}
      else{
      }
    }
    catch(e){
       print(e.toString());
    }
  }


}