import 'package:adexcloud/Modules/Services/cubit/states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
class ServicesCubit extends Cubit<ServicesStates> {
  ServicesCubit() :super(ServicesInitialState()) ;

  static ServicesCubit get (context) =>BlocProvider.of(context);
  http.Response? response  ;
  void GetServices () async{

     response = await http.get(
        Uri.parse("https://adexcloud.dz/dashboard/mypurchases") ,
      headers: {
          'Content-Type' : 'application/json' ,
          'Authorization': 'Ju5pEGyNPRbkVtkdlF69y3pk5fdKgX4jXkMXLTWm'
      }
    ) ;
    print(response!.statusCode) ;
    emit(GetServiceState()) ;
  }



}