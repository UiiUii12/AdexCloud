import 'dart:convert';

import 'package:adexcloud/Models/ServicesModel.dart';
import 'package:adexcloud/Shared/network/endpoints.dart';
import 'package:adexcloud/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class GlobalCubit extends Cubit<GlobalStates> {
  GlobalCubit() :super(InitialState());

  static GlobalCubit get(context) => BlocProvider.of(context);
   var i =1 ;
  http.Response? response  ;
   List<ServicesModel> services=[] ;
  List<ServicesModel> search_services_result=[] ;
  TextEditingController controller = TextEditingController() ;

  Future GetServices () async{

    response = await http.get(
        Uri.parse(Global_url+Services) ,
        headers: {
          'Content-Type' : 'application/json' ,
          'Accept': 'application/json' ,
          'api-mobile-token' : "sp8kcIFfmWDPBj8q4ArHeumgts89DHI8MQ5QlNBg"
        }
    ) ;
    if (response!.statusCode == 200) {

       json.decode(response!.body).forEach(
           (element)=> services.add(ServicesModel.fromJson(element))
       ) ;
      print( jsonDecode(response!.body)) ;
      print(services) ;
    }
   else {
     print(response!.statusCode) ;
     print(response!.body) ;
    }

   emit(GetServicesState()) ;
  }

  void SearchService () {

    search_services_result = services.where((element) => element.service_name.toLowerCase().contains(controller.text.toLowerCase()) ).toList();
    print(services);
    emit(SearchState()) ;
  }

}
// Ju5pEGyNPRbkVtkdlF69y3pk5fdKgX4jXkMXLTWm