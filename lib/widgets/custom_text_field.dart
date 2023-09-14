import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField(
      {this.obscureText = false, this.hintText, this.onChanged});
final  String? hintText;
final  bool obscureText;
final  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, decoration: TextDecoration.none),
      obscureText: obscureText,
      validator: (data) {
        if (data!.isEmpty) {
          return "field is required";
        }
        return null;
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          )),
    );
  }
}
