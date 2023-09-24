import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultTextField ({
  required TextEditingController controller ,
  required TextInputType type ,
  String? hint,
  Widget ? label ,
  required String? Function(String?)? validate ,
  IconData? prefIcon ,
  IconData? suffIcon ,
  void Function(String)? onSubmit ,
  void Function (String)? onChange ,
  bool obscureText =false ,

})
{

  return TextFormField(
  controller: controller,
    keyboardType: type,
    onFieldSubmitted: onSubmit,
    onChanged: onChange,
    validator: validate,
    decoration: InputDecoration(
      prefixIcon: Icon(prefIcon , color: Colors.black,) ,
      suffixIcon: Icon(suffIcon , color: Colors.black,) ,
      hintText: hint ,
      label: label,

    ),
);
}
