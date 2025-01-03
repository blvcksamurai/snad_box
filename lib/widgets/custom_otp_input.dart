import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snad_box/constants.dart';

class CustomOTPInput extends StatelessWidget {
  const CustomOTPInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 57,
        height: 70,
        margin: const EdgeInsets.only(right: 10),
        child: TextFormField(
          style: kOTPActive,
          cursorColor: kButtonColor,
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          },
          decoration: const InputDecoration(
            hintText: '0',
            hintStyle: kOTPStyle,
            focusColor: kButtonColor,
            filled: true,
            fillColor: kformColor,
            contentPadding:
                EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
              borderSide: BorderSide(color: kButtonColor, width: 1.5),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide(width: 1.5, color: Color(0xFFE3E3E3))),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                borderSide: BorderSide.none),
          ),
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ),
    );
  }
}
