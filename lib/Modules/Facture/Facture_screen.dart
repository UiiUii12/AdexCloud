import 'package:adexcloud/Layout/cubit/cubit.dart';
import 'package:adexcloud/Layout/cubit/states.dart';
import 'package:adexcloud/Models/FactureModel.dart';
import 'package:adexcloud/Shared/Components/Component.dart';
import 'package:adexcloud/Shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MesFacturesScreen extends StatefulWidget {
  const MesFacturesScreen({super.key});

  @override
  State<MesFacturesScreen> createState() => _MesFacturesScreenState();
}

class _MesFacturesScreenState extends State<MesFacturesScreen> with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this) ;
    return BlocConsumer<LayoutCubit , LayoutStates>(
      builder: (context ,state) {
        var cubit = LayoutCubit.get(context) ;

        return Scaffold(
            body : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12 , vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Spacer() ,
                        Image.asset("Assets/Images/logo.png") ,

                      ],
                    ),
                    SizedBox(height: 20,),
                    Text(
                        "Mes Factures" ,
                        style:TextStyle(
                          fontSize: 20 ,
                          fontWeight: FontWeight.w600,
                          color:Color(0xff293B55) ,
                        )
                    ) ,
                    SizedBox(height: 30,),
                    Row(
                      children: [
                        Container(
                          height:30 ,
                          width: MediaQuery.of(context).size.width*0.68,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8) ,
                            border: Border.all(color: defaultColor , width: 2) ,
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            onChanged: (value){
                              cubit.SearchFacture(int.parse(value)) ;
                            },
                            controller: cubit.controller,
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(
                              color: Color(0xff293B55) ,
                              fontSize: 14 ,
                            ),
                            decoration: InputDecoration(

                              hintText: "Rehercher" ,
                              hintStyle: TextStyle(
                                color: defaultColor ,
                                fontSize: 14 ,

                              ),
                              contentPadding: EdgeInsets.only(bottom: 10),
                              prefixIcon: Icon(Icons.search_rounded , color: defaultColor, size: 20,) ,
                              border: InputBorder.none ,
                            ),


                          ),
                        ) ,
                        SizedBox(width: 10,),
                        InkWell(
                          onTap : (){
                            cubit.ShowFilterFacture() ;
                            cubit.FilterFacture("${cubit.FactureStatus[cubit.selected_item_facture]}", cubit.date_from, cubit.date_to) ;

                          } ,
                          child: Container(
                            height: 30,
                            width: MediaQuery.of(context).size.width*0.23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8) ,
                              color: defaultColor ,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.filter_list , color: Colors.white, size: 20,) ,
                                SizedBox(width: 3,) ,
                                Text(
                                  "Filter" ,
                                  style: TextStyle(
                                      fontSize: 14 ,
                                      color: Colors.white
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ) ,
                    SizedBox(height: 10,) ,

                    Row(
                      children: [
                        Spacer(),
                        cubit.show_filter_facture ?  Filter(cubit.FactureStatus, cubit.selected_item_facture , cubit.on_item_select_facture , tabController ,context , cubit.date_from , cubit.date_to , cubit.PickDateFromCalender , cubit.PickInitialDateFromCalender)
                            : Container(),
                      ],
                    ),

                    SizedBox(height: 20,) ,
                    cubit.search_factures_result != null ? ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (item , index) => FactureCard(facture:cubit.search_factures_result[index], ),
                      separatorBuilder: (context ,index) => SizedBox(height: 10,),
                      itemCount: cubit.search_factures_result.length ,
                    ) : Container() ,

                  ],
                ),
              ),
            )
        );
      }, listener: (BuildContext context,  state) {  },
    );
  }

// Ju5pEGyNPRbkVtkdlF69y3pk5fdKgX4jXkMXLTWm
  Widget FactureCard (
      {
        required Facture facture ,
      }
      ) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8) ,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5) ,
              spreadRadius: 0 ,
              blurRadius: 8,
              offset: Offset(2,4) ,
            )
          ]
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10 , horizontal: 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Facutre ${facture.ID}" ,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontSize: 16 ,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff293B55) ,
                    ),
                  ),
                  Spacer() ,
                  InkWell(
                    child: Row(
                      children: [
                        Text("Télécharger" ,
                            style: TextStyle(
                              fontSize: 14 ,
                              color:  Color(0xff293B55) ,

                            )),
                        Icon(
                          Icons.file_download_outlined , color:  Color(0xff293B55) , size: 18,
                        )
                      ],
                    ),
                  ) ,
                ],
              ) ,

              Row(
                children: [
                  Text("Date: " ,
                      style: TextStyle(
                        fontSize: 14 ,
                        color:  Color(0xff293B55) ,

                      )),
                  Text("${DateFormat("yyyy-MM-dd").format(facture.due_date)}" ,
                      style: TextStyle(
                        fontSize: 14 ,
                        color: Color(0xff7E8AA2),

                      )) ,
                ],
              ),

              Row(
                children: [
                  Text("Montant total: " ,
                      style: TextStyle(
                        fontSize: 14 ,
                        color:  Color(0xff293B55) ,

                      )),
                  Text("${facture.total}" ,
                      style: TextStyle(
                        fontSize: 14 ,
                        color: Color(0xff7E8AA2),

                      )) ,
                ],
              ),

              Row(
                children: [
                  Text("Device: " ,
                      style: TextStyle(
                        fontSize: 14 ,
                        color:  Color(0xff293B55) ,

                      )),
                  Text("${facture.currency}" ,
                      style: TextStyle(
                        fontSize: 14 ,
                        color: Color(0xff7E8AA2),

                      )) ,
                ],
              ),

              Row(
                children: [
                  Text("Etat facture: " ,
                      style: TextStyle(
                        fontSize: 14 ,
                        color:  Color(0xff293B55) ,

                      )),
                  Text("${facture.status}" ,
                      style: TextStyle(
                        fontSize: 14 ,
                        color: Color(0xfff4841c),

                      )) ,
                ],
              ),



            ]
        ),
      ) ,
    ) ;
  }
}
