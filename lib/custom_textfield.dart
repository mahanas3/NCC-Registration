import 'package:flutter/material.dart';

class Custom_textfield extends StatelessWidget {
  Custom_textfield(
      {super.key,
      required this.text,
      required this.controller,
      required this.text1,
      required this.icon});

  String text;

  String text1;

  Widget icon;

  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      // validator: (value){
      //   if (value == null || value.isEmpty || !value.contains('@')) {
      //     return 'please enter @';
      //   }
      //   return null;
      // },
      controller: controller,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          prefixIcon: icon,
          prefixIconColor: Colors.purple,
          labelText: text,
          hintText: text1,
          hintStyle: const TextStyle(color: Colors.white),
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purpleAccent),
              borderRadius: BorderRadius.all(
                Radius.elliptical(30, 30),
              ))),
    );
  }
}
