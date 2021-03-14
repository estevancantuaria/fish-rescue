import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String label;
  String hint;
  bool password;
  TextEditingController controller;
  FormFieldValidator<String> validator;

  AppText(this.label,this.hint,{this.password=false,this.controller,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: password,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(), labelText: label, hintText: hint),
    );
  }
}
