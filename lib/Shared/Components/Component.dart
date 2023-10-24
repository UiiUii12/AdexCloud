
import 'package:adexcloud/Shared/Style/Theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Style/assets.dart';
const defaultColor =Color(0XFF566ACC) ;
Widget defaultTextField({
  required TextEditingController controller,
  required TextInputType type,
  String? hint,
  Widget? label,
  required String? Function(String?)? validate,
  IconData? prefIcon,
  IconData? suffIcon,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  bool obscureText = false,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validate,
    decoration: InputDecoration(
      prefixIcon: Icon(
        prefIcon,
        color: Colors.black,
      ),
      suffixIcon: Icon(
        suffIcon,
        color: Colors.black,
      ),
      hintText: hint,
      label: label,
    ),
  );
}

Widget Filter (
  List etats,
    int selected_index ,
    Function on_item_select ,
    TabController tabController ,
    BuildContext context ,
    TextEditingController date_from ,
    TextEditingController date_to ,
    Function PickDateFromCalender ,
    Function PickInitialDateFromCalender ,
) {

  return Container(
    height: 150,
    width: 250,
    decoration: BoxDecoration(
      color:Colors.white ,
      borderRadius: BorderRadius.circular(8),
      boxShadow:  [BoxShadow(
        color: Colors.grey.withOpacity(0.5) ,
        spreadRadius: 0 ,
        blurRadius: 8,
        offset: Offset(2,4) ,
      )
        ]

    ),
    child: Column(
        children: [
      TabBar(
        controller: tabController,
        unselectedLabelColor: Color(0xff7E8AA2),
        unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        labelColor: Color(0xff293B55),
        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        tabs: [
          Tab(
            text: "Etat",
          ),
          Tab(
            text: "Date",
          ),
        ],
      ) ,
      Expanded(
        child: TabBarView(
          controller: tabController,
            children: [
              Container(
                height: 100,
                child: GridView.builder(
                  shrinkWrap: true,

                  physics: NeverScrollableScrollPhysics(),
                   itemCount: etats.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2 ,
                      crossAxisSpacing: 10 ,
                      mainAxisSpacing: 5 ,
                      childAspectRatio: 6
                    ),
                    itemBuilder: (context , index) {
                      return
                          InkWell(
                            onTap: (){
                              on_item_select(index);
                            },
                            child: selected_index == index ? Row(
                              children: [
                                Icon(Icons.check , color: defaultColor,size: 20,) ,
                                SizedBox(width: 5,) ,
                                Text(
                                  "${etats[index]}" ,
                                  style: TextStyle(
                                    fontSize: 14 ,
                                    fontWeight: FontWeight.w400 ,
                                    color:defaultColor,
                                  ),
                                )
                              ],
                            ):Padding(
                              padding: const EdgeInsets.only(left:25),
                              child: Text(
                                "${etats[index]}" ,
                                style: TextStyle(
                                  fontSize: 14 ,
                                  fontWeight: FontWeight.w400 ,
                                  color: Color(0xff7E8AA2),
                                ),
                              ),
                            )
                          );

                    }
                ),
              ) ,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ) ,
                      Expanded(
                        child: Text(
                          "De:" ,
                          style: TextStyle(
                            fontSize: 14 ,
                            fontWeight: FontWeight.w400 ,
                            color:defaultColor,
                          ),
                        ),
                      ),

                      Container(
                        height: 30,
                        width: 195,
                        margin : EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3) ,
                          color: Color(0xffC5C5C5).withOpacity(0.2),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          controller:date_from,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Color(0xff293B55) ,
                            fontSize: 14 ,
                          ),
                          decoration: InputDecoration(
                            hintText: "Date début" ,
                            hintStyle: TextStyle(
                              color: Color(0xff7E8AA2),
                              fontSize: 14 ,

                            ),
                            contentPadding: EdgeInsets.only(bottom: 10 , left: 5 ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                PickInitialDateFromCalender(context , date_from) ;
                              }, icon: Icon(Icons.calendar_today_rounded, color: Colors.black,size:18) ,

                            ) ,
                            border: InputBorder.none ,
                          ),


                        ),
                      ),
                    ],
                  ) ,
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ) ,
                      Expanded(
                        child: Text(
                          "A:" ,
                          style: TextStyle(
                            fontSize: 14 ,
                            fontWeight: FontWeight.w400 ,
                            color:defaultColor,
                          ),
                        ),
                      ),

                      Container(
                        height: 30,
                        width: 195,
                        margin : EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3) ,
                            color: Color(0xffC5C5C5).withOpacity(0.2),
                        ),
                        child: TextFormField(
                          readOnly: true,
                          controller:date_to,
                          textAlignVertical: TextAlignVertical.center,
                          style: TextStyle(
                            color: Color(0xff293B55) ,
                            fontSize: 14 ,
                          ),
                          decoration: InputDecoration(
                            hintText: "Date fin" ,
                            hintStyle: TextStyle(
                              color: Color(0xff7E8AA2),
                              fontSize: 14 ,

                            ),
                            contentPadding: EdgeInsets.only(bottom: 10 , left: 5 ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                PickDateFromCalender(context , date_to) ;
                              }, icon: Icon(Icons.calendar_today_rounded, color: Colors.black, size:18) ,

                            ) ,
                            border: InputBorder.none ,
                          ),


                        ),
                      ),
                    ],
                  ) ,
                ],
              )
            ]
        ),
      ),
    ]),
  );

}
Widget profilComp({required String icon, required String item,required String route}){
  return Container(
    height:45 ,
      width: 316,
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
  child: Row(
  children: [
    SizedBox(width: 10,),
    SizedBox(
     height: 15,
     width: 15,
     child: Image.asset(icon)),
    SizedBox(width: 10,),
    Text(item,style: FontStyles.style5,),
    SizedBox(width: 30,),
    SizedBox(
    height: 15,
    width: 15,
    child: Image.asset(Assets.seeMoreIcon)),

  ],
  ),
  ));
}


