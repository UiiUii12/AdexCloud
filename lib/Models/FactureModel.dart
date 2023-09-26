

class FacturesModel {

  final List<Facture> paid_factures ;
  final List<Facture> unpaid_factures ;


  FacturesModel({required this.paid_factures, required this.unpaid_factures});



  factory FacturesModel.fromJson (Map<String, dynamic> jsonn) {
    List<Facture> paid_facture =[];
    jsonn["paid_invoices"].forEach(
            (element) => paid_facture.add(Facture.fromJson(element))
    );
    List<Facture> unpaid_facture =[];
    jsonn["unpaid_invoices"].forEach(
            (element) => unpaid_facture.add(Facture.fromJson(element))
    );
    return FacturesModel(
        paid_factures: paid_facture,
        unpaid_factures: unpaid_facture

    );
  }

}



class Facture {
  final int ID ;
  final String currency;
  final DateTime due_date ;
  final String status ;
  final double total ;


  Facture({required this.ID, required this.currency, required this.due_date, required this.status, required this.total});



  factory Facture.fromJson ( Map<String , dynamic> json) {
    return Facture(
        ID: json["invoiceid"],
        currency: json["currency"],
        due_date: DateTime.parse(
            json["due_date"].substring(0, 10) + " " +
                json["due_date"].substring(11, 16)),
        status: json["status"],
        total: double.parse(json["total"])  ,);

  }



}

