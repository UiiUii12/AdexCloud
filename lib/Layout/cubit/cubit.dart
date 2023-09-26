import 'dart:async';
import 'dart:convert';

import 'package:adexcloud/Layout/cubit/states.dart';
import 'package:adexcloud/Models/CommandeModel.dart';
import 'package:adexcloud/Models/FactureModel.dart';
import 'package:adexcloud/Models/ServicesModel.dart';
import 'package:adexcloud/Shared/network/endpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() :super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);
  String token = "DrLYQbkUMqVw4RlEx3PHokRbdm5xZgBNKNI8BrUm" ;
  /////////////////////////////// Service data and functions /////////////////////////////////////////////
  bool show_filter_service = false ;
  var i =1 ;
  http.Response? response  ;
  List<ServicesModel> services=[] ;
  List<ServicesModel> search_services_result=[] ;
  int selected_item = 1 ;
  TextEditingController controller = TextEditingController() ;
  TextEditingController date_from = TextEditingController() ;
  TextEditingController date_to = TextEditingController() ;
  List ServiceStatus =["Tous" ,"Pending" , "Actif" , "Suspendu" , "Expired"] ;
  Future GetServices () async{

    response = await http.get(
        Uri.parse(Global_url+Services) ,
        headers: {
          'Content-Type' : 'application/json' ,
          'Accept': 'application/json' ,
          'api-mobile-token' : token
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
    search_services_result = services ;
    emit(GetServicesState()) ;
  }

  void SearchService () {

    search_services_result = services.where((element) => element.service_name.toLowerCase().contains(controller.text.toLowerCase()) ).toList();
    print(services);
    emit(SearchState()) ;
  }

  void on_item_select (int value) {
    selected_item =value ;
    emit(ChangeSelectedIndexState());

  }


  Future<void> PickInitialDateFromCalender (BuildContext context ,TextEditingController controller ) async {
    DateTime? date ;
    date = await showDatePicker(
        context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2050)
    ) ;
    controller.text =  DateFormat("yyyy-MM-dd").format( date!);

  }
  Future<void> PickDateFromCalender (BuildContext context ,TextEditingController controller ) async {
    DateTime? date ;
     date = await showDatePicker(
         context: context, initialDate: date_from.text != "" ? DateTime.parse(date_from.text) :DateTime.now(), firstDate: date_from.text != "" ? DateTime.parse(date_from.text) :DateTime(2000), lastDate: DateTime(2050)
     ) ;
       controller.text =  DateFormat("yyyy-MM-dd").format( date!);

  }

  void FilterServices (String status , TextEditingController date_from , TextEditingController date_to) {

    
    search_services_result = services.where((element) =>
       status != "Tous" ? element.status.toLowerCase()==status.toLowerCase():true && date_from.text != "" ? element.creation_date.isAfter(DateTime.parse(date_from.text)): true &&
            date_to.text != "" ? element.creation_date.isBefore(DateTime.parse(date_to.text)) : true
    ).toList();

emit(FilterState());
  }


  void ShowFilter() {
    show_filter_service = ! show_filter_service ;
    emit(ShowFilterState()) ;
  }






  ////////////////////////////// Commande data and functions /////////////////////////////////////////////////////////

  List CommandeStatus =["Tous" ,"En Attente" , "Payé"] ;
  List<CommandeModel> search_commande_result=[] ;
  List<CommandeModel> commands =[] ;
  bool show_filter_commande = false ;
  int selected_item_commande= 0 ;
  void SearchCommande (String input) {

    search_commande_result = commands.where((element) => element.code_commande.toLowerCase().contains(input.toLowerCase()) ).toList();

    emit(SearchState()) ;
  }

  Future GetCommandes () async{

    response = await http.get(
        Uri.parse(Global_url+Commandes) ,
        headers: {
          'Content-Type' : 'application/json' ,
          'Accept': 'application/json' ,
          'api-mobile-token' : token
        }
    ) ;
    if (response!.statusCode == 200) {

 print("///////////////////////////////////////:");
 print( jsonDecode(response!.body)) ;
 json.decode(response!.body).forEach( 
         (element)=> commands.add(CommandeModel.fromJson(element))
 ) ;



    }
    else {
      print(response!.statusCode) ;
      print(response!.body) ;
    }
    search_commande_result=commands ;
    emit(GetCommandesState()) ;
  }

  void FilterCommande (String status , TextEditingController date_from , TextEditingController date_to) {


    search_commande_result= commands.where((element) =>
    status != "Tous" ? element.status.toLowerCase()==status.toLowerCase():true && date_from.text != "" ? element.creation_date.isAfter(DateTime.parse(date_from.text)): true &&
        date_to.text != "" ? element.creation_date.isBefore(DateTime.parse(date_to.text)) : true
    ).toList();

    emit(FilterState());
  }


  void ShowFilterCommande() {
    show_filter_commande = ! show_filter_commande ;
    emit(ShowFilterState()) ;
  }
  void on_item_select_commande (int value) {
    selected_item_commande =value ;
    emit(ChangeSelectedIndexState());

  }

   void ServiceDetails(int id , BuildContext context) {

    ServicesModel service =  services.where((element) => element.ID == id ).first;

    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context)
    {
      return Container(
        height: MediaQuery.of(context).size.height*0.6,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "${service.service_name}",
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff293B55),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(8),

                    ),
                    child: Center(
                      child: Text(
                        "${service.status}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height:20),
              service.domaine_name != null ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider() ,
                  Text("Nom de domaine: ",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff293B55),

                      )),

                  Text("${service.domaine_name}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xff7E8AA2),
                    ),),
                ],
              ) : Container(),
              Divider() ,
              Text("Date de cration: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff293B55),

                  )),
              Text("${DateFormat("yyyy-MM-dd HH:mm").format(
                  service.creation_date)}",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff7E8AA2),
                ),),
              Divider() ,
              Text("Date d'éxpiration: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff293B55),

                  )),
              Text("${DateFormat("yyyy-MM-dd HH:mm").format(
                  service.expiration_date)}",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff7E8AA2),
                ),),
              Divider() ,
              Text("Date d'éxpiration du support: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff293B55),

                  )),
              Text("${DateFormat("yyyy-MM-dd HH:mm").format(
                  service.expiration_date_support)}",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff7E8AA2),
                ),),
              Divider() ,
              Text("Durée restante: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff293B55),

                  )),
              Text("${service.period}",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff7E8AA2),
                ),),
              Divider() ,
              Text("L'identifiant du service: ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff293B55),

                  )),
              Text("${service.ID}",
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff7E8AA2),
                ),),
              Divider() ,
            ],
          ),
        ),
      );
    });

    emit(ShowBottomShzztState()) ;

   }


   ////////////////////////////////////////// Facture data and function ////////////////////////////////////////

  FacturesModel? factures  ;
  List<Facture> search_factures_result =[] ;
  List<Facture> Allfactures =[] ;
  List FactureStatus =["Tous" ,"Unpaid" , "Paid" ] ;
  bool show_filter_facture =false ;
  int selected_item_facture = 0 ;
  Future GetFactures () async{

    response = await http.get(
        Uri.parse(Global_url+Factures) ,
        headers: {
          'Content-Type' : 'application/json' ,
          'Accept': 'application/json' ,
          'api-mobile-token' : token
        }
    ) ;
    if (response!.statusCode == 200) {

      print("///////////////////////////////////////:");
      print( jsonDecode(response!.body)) ;
      factures = FacturesModel.fromJson(json.decode(response!.body));

      Allfactures.addAll(factures!.paid_factures);
      Allfactures.addAll(factures!.unpaid_factures);
      search_factures_result = Allfactures ;
    }
    else {
      print(response!.statusCode) ;
      print(response!.body) ;
    }

    emit(GetFactureState()) ;
  }

  void FilterFacture (String status , TextEditingController date_from , TextEditingController date_to) {

    if ( status == "Paid") {
      search_factures_result= factures!.paid_factures.where((element) =>
      date_from.text != "" ? element.due_date.isAfter(DateTime.parse(date_from.text)): true &&
          date_to.text != "" ? element.due_date.isBefore(DateTime.parse(date_to.text)) : true
      ).toList();
    }
    if ( status == "Unpaid") {
      search_factures_result= factures!.unpaid_factures.where((element) =>
      date_from.text != "" ? element.due_date.isAfter(DateTime.parse(date_from.text)): true &&
          date_to.text != "" ? element.due_date.isBefore(DateTime.parse(date_to.text)) : true
      ).toList();
    }
    if ( status == "Tous") {
      search_factures_result= Allfactures.where((element) =>
      date_from.text != "" ? element.due_date.isAfter(DateTime.parse(date_from.text)): true &&
          date_to.text != "" ? element.due_date.isBefore(DateTime.parse(date_to.text)) : true
      ).toList();
    }

    emit(FilterState());
  }


  void ShowFilterFacture() {
    show_filter_facture = ! show_filter_facture ;
    emit(ShowFilterState()) ;
  }
  void on_item_select_facture (int value) {
    selected_item_facture =value ;
    emit(ChangeSelectedIndexState());

  }
  void SearchFacture ( int input) {
    print(input);
    if (input.toString() != null)
    {
      search_factures_result = Allfactures.where(
              (element) =>
              element.ID.toString().toLowerCase().contains(input.toString().toLowerCase())
      ).toList();

      emit(SearchState()) ;
    }

  }

  Future Login () async{

    response = await http.post(
        Uri.parse(Global_url+"auth/login") ,

      body: {
          "email" : "ines.nedjaa@gmail.com" ,
          "password" : "ikramikram" ,

      }
    ) ;
    if (response!.statusCode == 201) {

      print("///////////////////////////////////////:");
      print( jsonDecode(response!.body)) ;




    }
    else {
      print(response!.statusCode) ;
      print(response!.body) ;
    }
    emit(GetCommandesState()) ;
  }


}
