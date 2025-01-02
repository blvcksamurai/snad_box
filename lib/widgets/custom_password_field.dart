import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../constants.dart';

class CustomPasswordInputField extends StatefulWidget {
  final String hintText;
  Function(String)? onchanged;
  final TextEditingController? controller;

  CustomPasswordInputField({
    super.key,
    this.controller,
    required this.hintText,
    this.onchanged,
  });

  @override
  State<CustomPasswordInputField> createState() =>
      _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onchanged,
      controller: widget.controller,
      cursorColor: kButtonColor,
      obscureText: _obscureText,
      style: const TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        color: Colors.black,
      ),
      decoration: InputDecoration(
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
          borderSide: BorderSide(width: 2, color: Color(0xFFE3E3E3)),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Ionicons.eye_off_outline : Ionicons.eye_outline,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
