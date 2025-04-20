import 'package:flutter/material.dart';
import 'package:search_engine/utils/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    required this.controller,
    super.key,
    required this.hintText,
    this.suffixIcon,
  });
  final TextEditingController controller;
  final String hintText;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'NOT Empty!';
          }
          return null;
        },
        controller: controller,
        cursorColor: primaryColor,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins-Regular',
          ),
          labelStyle: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
          border: _getBorderStyle(),
          focusedBorder: _getBorderStyle(),
          enabledBorder: _getBorderStyle(color: Colors.grey),
        ),
      ),
    );
  }
}

OutlineInputBorder _getBorderStyle({Color? color}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: BorderSide(
      color: color ?? primaryColor,
    ),
  );
}
