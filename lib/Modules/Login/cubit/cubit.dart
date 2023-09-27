
import 'dart:convert';
import 'package:adexcloud/Modules/Dashboard/DashboardScreen.dart';
import 'package:adexcloud/Shared/Network/Endpoints.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:adexcloud/Modules/Login/Cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';


class LoginCubit extends Cubit<LoginStates>{


  LoginCubit():super(LoginInitialState());
  static LoginCubit get(context)=>BlocProvider.of(context);
  TextEditingController emailController=new TextEditingController() ;
  TextEditingController passwordController=new TextEditingController() ;
  final formKey = GlobalKey<FormState>();
  bool visibilityPassword=false;
///////////////////////////////////////////////////////////

  Future<void> ChangePassword() async {
    const url = 'https://adexcloud.dz/password/reset';
    if(await canLaunchUrl(url as Uri)){
      await launchUrl(url as Uri);
    }else {
      throw 'Could not launch $url';
    }
  }
  /////////////////////////////////////////////////////////
  Future<void> saveAuthToken(String name,String email,String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('email', email);
    prefs.setString('token', token);
  }
  ////////////////////////////////////////////////////////
  void login(BuildContext context) async{
    try{
      Response response = await post(
          Uri.parse(Global_url+Login),
          body: {
            'email' : emailController.text,
            'password' : passwordController.text
          }
      );
      if(response.statusCode==201){
        print("*******************************************");
        var data=jsonDecode(response.body);
        saveAuthToken(data['name'],data['email'],data['token'],);
        print('&&&&&&&&&&&&&&&&&&&&&&&&&${data['token']}&&&&&&&&&&&&&&&&&&&');
        Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => DashboardScreen()));}
      else{
        print("khata2*********************************************");
      }
    }
    catch(e){
       print('**************************${e.toString()}*****&&&&&***************');
    }
  }
  ////////////////////////////////////////////////////////////////////



}