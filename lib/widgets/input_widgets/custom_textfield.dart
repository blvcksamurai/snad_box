import 'package:flutter/material.dart';
import '../../utils/constants.dart';

class CustomTextfield extends StatefulWidget {
  final String hintText;

  const CustomTextfield({
    super.key,
    required this.hintText,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  final int _maxCharacters = 200;
  TextEditingController? controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(); // Initialize the controller
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          maxLines: 5,
          maxLength: _maxCharacters,
          cursorColor: kButtonColor,
          style: const TextStyle(
              fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),
          decoration: InputDecoration(
            hintText: widget.hintText, // Correct reference to hintText
            focusColor: kButtonColor,
            filled: false,
            fillColor: kformColor,
            hintStyle: kHintText,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
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
          ),
        ),
      ],
    );
  }
}
