
class ServicesModel {
  final String service_name ;
  final String status ;
  final String? domaine_name ;
  final String creation_date ;
  final String expiration_date ;
  final String expiration_date_support ;
  final String? period ;
  final int ID ;
  final int clientID ;
  final int productID  ;
  final int orderID  ;

  ServicesModel(
      {required this.service_name, required this.status, this.domaine_name, required this.creation_date, required this.expiration_date,
        required this.expiration_date_support, this.period, required this.ID, required this.clientID, required this.productID, required this.orderID});


   factory ServicesModel.fromJson ( Map<String , dynamic> json) {
     return ServicesModel(
    service_name : json["productname"] ,
    status : json["status"].toUpperCase(),
    domaine_name : json["domain_name"],
    creation_date : json["created_at"].substring(0,10)+" "+json["created_at"].substring(11,16),
    expiration_date : json["cycleend"].substring(0,10)+" "+json["cycleend"].substring(11,16),
    expiration_date_support : json["cycleend"].substring(0,10)+" "+json["cycleend"].substring(11,16),
    period : "312",
    ID : json["serviceid"],
    clientID : json["subclientid"],
    productID : json["productid"],
    orderID : json["orderid"], ) ;
  }



}