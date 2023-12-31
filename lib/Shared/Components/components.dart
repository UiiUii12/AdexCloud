import 'package:adexcloud/Shared/Style/Colors.dart';
import 'package:adexcloud/Shared/Style/Theme.dart';
import 'package:adexcloud/Shared/Style/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///////////////////////////////////////////////
Widget defaultButton({
  required String text,
  required Function() function,
}) =>
    Container(
      width: 320,
      height: 45,
      child: ElevatedButton(
        onPressed: () {
          function();
        },
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
        ),
      ),
    );
////////////////////////////////////////////////
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  String? hint,
  String? label,
  double radius = 0,
  double suffContainerRadius = 13,
  Widget? prefIcon,
  Widget? suffIcon,
  Color suffIconColor = Colors.white,
  double suffIconSize = 30,
  void Function(String)? onSubmit,
  void Function(String)? onChange,
  Function()? onTap,
  required String? Function(String?)? validate,
  required bool ObscureText,
  Function()? suffpressd,
  Color suffContainerColor = Colors.black,
  InputBorder? border,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      obscureText: ObscureText,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontSize: 10, color: Color(0xffBDBDBD)),
        hintStyle: const TextStyle(fontSize: 12, color: Color(0xffC5C5C5)),
        hintText: hint,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 0.4)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: primaryColor, width: 2)),
        prefixIcon: prefIcon != null ? prefIcon : null,
        suffixIcon: suffIcon != null
            ? IconButton(
                onPressed: suffpressd,
                icon: suffIcon,
              )
            : null,
      ),
    );
////////////////////////////////////////////////////
Widget iconButton({
  required Widget label,
  required Function() function,
}) =>
    TextButton(
      onPressed: function,
      child: label,
    );
///////////////////////////////////////////////////
Widget notificationCard(
    {required String objet,
    required String contenu,
    required String date,
    required bool read}) {
  return Container(
    height: 46,
    width: 316,
    decoration: BoxDecoration(
        color: read ? Colors.white : primaryColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(
                5.0,
                5.0,
              ))
        ]),
    child: Column(
      children: [
        Row(
          children: [
            Image.asset(Assets.notificationIcon),
            SizedBox(
              width: 5,
            ),
            Text(
              objet,
              style: FontStyles.style7,
            ),
            SizedBox(
              width: 90,
            ),
            Text(
              date,
              style: FontStyles.style9,
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          contenu,
          style: read ? FontStyles.style10 : FontStyles.style8,
        )
      ],
    ),
  );
}
////////////////////////////////////////////
Widget dashboardItem(
    {
      required Color color,
      required String icon,
      required String title,
      required String contenu
    })
{
  return Container(
    height:75,
    width: 162,
    decoration: BoxDecoration(
      color:color,
    ),
    child: Column(
      children: [
        SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(icon)),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text(title,style:FontStyles.style11 ,),
          SizedBox(width: 30,),
          Text(contenu,style: FontStyles.style11,),
        ],)
      ],
    ),
  );
}
