import 'package:flutter/material.dart';

import '../utils/constants.dart';

class CustomInputField extends StatelessWidget {
  final String hintText;
  TextEditingController? controller;
  Function(String)? onchanged;
  Widget? prefixIcon;

  CustomInputField({
    super.key,
    this.controller,
    this.onchanged,
    this.prefixIcon,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onchanged,
      cursorColor: kButtonColor,
      style: const TextStyle(
          fontSize: 16.0, fontWeight: FontWeight.w300, color: Colors.black),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          focusColor: kButtonColor,
          filled: false,
          fillColor: kformColor,
          hintStyle: kHintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16.0),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide(color: kButtonColor, width: 2.0),
          ),
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              borderSide: BorderSide(width: 2, color: Color(0xFFE3E3E3))),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              borderSide: BorderSide.none),
          hintText: hintText),
    );
  }
}
