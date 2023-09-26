
import 'package:intl/intl.dart';

class ServicesModel {
  final String service_name ;
  final String status ;
  final String? domaine_name ;
  late DateTime creation_date ;
  late DateTime expiration_date ;
  late DateTime expiration_date_support ;
  late final int period   ;
  final int ID ;
  final int clientID ;
  final int productID  ;
  final int orderID  ;

  ServicesModel(

      {

      required this.service_name, required this.status, this.domaine_name, required this.creation_date,
      required this.expiration_date,
        required this.expiration_date_support,  required this.ID, required this.clientID,
      required this.productID, required this.orderID}){
    period= expiration_date.difference(creation_date).inDays  ;

  }


   factory ServicesModel.fromJson ( Map<String , dynamic> json) {
     return ServicesModel(
    service_name : json["productname"] ,
    status : json["status"].toUpperCase(),
    domaine_name : json["domain_name"],
    creation_date :
    DateTime.parse(json["created_at"].substring(0,10)+" "+json["created_at"].substring(11,16)),
    expiration_date : DateTime.parse(json["cycleend"].substring(0,10)+" "+json["cycleend"].substring(11,16)),
    expiration_date_support : DateTime.parse(json["cycleend"].substring(0,10)+" "+json["cycleend"].substring(11,16)),
    ID : json["serviceid"],
    clientID : json["subclientid"],
    productID : json["productid"],
    orderID : json["orderid"], ) ;
  }



}