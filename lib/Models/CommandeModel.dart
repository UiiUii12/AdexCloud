
import 'dart:convert';

import 'package:adexcloud/Models/ServicesModel.dart';
import 'package:intl/intl.dart';

class CommandeModel {
  final String status;

  final DateTime creation_date;

  final int ID;

  final String code_commande;

  final List<Service> item;


  CommandeModel(
      {required this.creation_date, required this.status, required this.ID,
        required this.code_commande, required this.item}) {

  }


  factory CommandeModel.fromJson (Map<String, dynamic> jsonn) {
    List<Service> services = [];
    json.decode(jsonn["items"]).forEach(
            (element) => services.add(Service.fromJson(element))
    );
    return CommandeModel(
      status: jsonn["etat_commande"],
      ID: jsonn["id"],
      code_commande: jsonn["commande_code"],
      item: services,
      creation_date: DateTime.parse(
          jsonn["commande_datetime"].substring(0, 10) + " " +
              jsonn["commande_datetime"].substring(11, 16)),
    );
  }

}



  class Service {
  final String service_name ;
  final int ID ;


  Service(

  {

  required this.service_name,   required this.ID, }){

  }


  factory Service.fromJson ( Map<String , dynamic> json) {
  return Service(
  service_name : json["productgroup"] ,
  ID : json["service"]);
  }



  }

