import 'package:flutter/material.dart';

import '../constanse.dart';

class CustomformTextField extends StatelessWidget {
  CustomformTextField(
      {this.onChange, this.hintText, this.obsecureText = false});
  String? hintText;
  Function(String)? onChange;
  bool? obsecureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      obscureText: obsecureText!,
      validator: (date) {
        if (date!.isEmpty) {
          return 'value is requaird';
        }
      },
      onChanged: onChange,
      decoration: InputDecoration(
        
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: kPramairycolor,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(12),
            right: Radius.circular(12),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(12),
            right: Radius.circular(12),
          ),
        ),
      ),
    );
  }
}
