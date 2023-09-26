import 'package:adexcloud/Layout/cubit/cubit.dart';
import 'package:adexcloud/Layout/cubit/states.dart';
import 'package:adexcloud/Models/ServicesModel.dart';
import 'package:adexcloud/Shared/Components/Component.dart';
import 'package:adexcloud/Shared/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MesServicesScreen extends StatefulWidget {
  const MesServicesScreen({super.key});

  @override
  State<MesServicesScreen> createState() => _MesServicesScreenState();
}

class _MesServicesScreenState extends State<MesServicesScreen> with TickerProviderStateMixin {

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
                     Image.asset("assets/images/logo.png") ,

                   ],
                 ),
                 SizedBox(height: 20,),
                 Text(
                     "Mes services" ,
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
                         onChanged: (value){
                           cubit.SearchService() ;
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
                         cubit.ShowFilter() ;
                         cubit.FilterServices("${cubit.ServiceStatus[cubit.selected_item]}", cubit.date_from, cubit.date_to) ;

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
                     cubit.show_filter_service ?  Filter(cubit.ServiceStatus, cubit.selected_item , cubit.on_item_select , tabController ,context , cubit.date_from , cubit.date_to , cubit.PickDateFromCalender , cubit.PickInitialDateFromCalender)
                    : Container(),
                   ],
                 ),

                 SizedBox(height: 20,) ,
                 cubit.search_services_result != null ? ListView.separated(
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder: (item , index) => ServiceCard(service:cubit.search_services_result![index]),
                   separatorBuilder: (context ,index) => SizedBox(height: 10,),
                   itemCount: cubit.search_services_result!.length ,
                 ) : Container()
               ],
                  ),
            ),
          )
        );
      }, listener: (BuildContext context,  state) {  },
    );
  }

// Ju5pEGyNPRbkVtkdlF69y3pk5fdKgX4jXkMXLTWm
  Widget ServiceCard (
  {
    required ServicesModel service
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
        padding:  EdgeInsets.symmetric(vertical: 10 , horizontal: 5),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${service.service_name}" ,
                   overflow: TextOverflow.clip,
                   style: TextStyle(
                     fontSize: 16 ,
                     fontWeight: FontWeight.w500,
                     color: Color(0xff293B55) ,
                   ),
                ) ,
                Spacer() ,
                Container(
                  height: 20 ,
                  width: 70 ,
                  decoration :BoxDecoration(
                    color: Colors.orange ,
                    borderRadius: BorderRadius.circular(8) ,

                  ) ,
                  child: Center(
                    child: Text(
                      "${service.status}" ,
                      style: TextStyle (
                        fontSize :12 ,
                        color :Colors.white ,
                      ),
                    ),
                  ),
                ),

              ],
            ) ,

           service.domaine_name != null ? Row(
              children: [
                Text("Nom de domaine: " ,
                    style: TextStyle(
                      fontSize: 14 ,
                      color: Color(0xff293B55) ,

                    )) ,
                Text("${service.domaine_name}",
                  style: TextStyle(
                    fontSize: 14 ,
                    color: Color(0xff7E8AA2),
                  ),),
              ],
            ) : Container() ,
            Row(
              children: [
                Text("Date de cration: " ,
                    style: TextStyle(
                      fontSize: 14 ,
                      color: Color(0xff293B55) ,

                    )) ,
                Text("${DateFormat("yyyy-MM-dd HH:mm").format(service.creation_date)}" ,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14 ,
                    color: Color(0xff7E8AA2),
                  ),),
              ],
            ) ,
            Row(
              children: [
                Text("Date d'éxpiration: " ,
                    style: TextStyle(
                      fontSize: 14 ,
                      color: Color(0xff293B55) ,

                    )) ,
                Text("${DateFormat("yyyy-MM-dd HH:mm").format(service.expiration_date)}" ,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14 ,
                    color: Color(0xff7E8AA2),
                  ),),
              ],
            ) ,
            Row(
              children: [
                Text("Date d'éxpiration du support: " ,
                    style: TextStyle(
                      fontSize: 14 ,
                      color: Color(0xff293B55) ,

                    )) ,
                Text("${DateFormat("yyyy-MM-dd HH:mm").format(service.expiration_date_support)}" ,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14 ,
                    color: Color(0xff7E8AA2),
                  ),),
              ],
            ) ,
            Row(
              children: [
                Text("Durée restante: " ,
                    style: TextStyle(
                      fontSize: 14 ,
                      color: Color(0xff293B55) ,

                    )) ,
                Text("${service.period}" ,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14 ,
                    color: Color(0xff7E8AA2),
                  ),),
              ],
            ) ,
            Row(
              children: [
                Text("L'identifiant du service: " ,
                    style: TextStyle(
                      fontSize: 14 ,
                      color: Color(0xff293B55) ,

                    )) ,
                Text("${service.ID}" ,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14 ,
                    color: Color(0xff7E8AA2),
                  ),),
              ],
            ) ,
          ],
        ),
      ) ,
    ) ;
  }
}
