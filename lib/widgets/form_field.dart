import 'package:flutter/material.dart';
import 'package:snad_box/utils/constants.dart';

class CustomFormField extends StatefulWidget {
  const CustomFormField({super.key});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {}); // Rebuild when focus changes
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 183,
      height: 56,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF7EA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFFFD07F),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        shadows: _focusNode.hasFocus
            ? const [
                BoxShadow(
                  color: Color(0x3FFFD999),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                  spreadRadius: 4,
                )
              ]
            : null,
      ),
      child: TextFormField(
        focusNode: _focusNode,
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Enter text',
          hintStyle: TextStyle(color: Colors.grey),
        ),
        style: const TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }
}


//  Material(
//         elevation: 4.0, // Elevation for the shadow effect

//         shadowColor: Colors.blue.withOpacity(0.5), // Shadow color
//         borderRadius: BorderRadius.circular(16),
//         child: TextFormField(
//           decoration: InputDecoration(
//             // labelText: 'Enter your text',
//             hintText: 'Enter your first name',
//             hintStyle: kHintText,
//             filled: true,
//             fillColor: Colors.transparent,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: const BorderSide(
//                 color: Colors.grey, // Unfocused border color
//                 width: 1.0,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: const BorderSide(
//                 color: kButtonColor, // Focused border color
//                 width: 2.0,
//               ),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16.0),
//               borderSide: const BorderSide(
//                 color: Color(0xFFE3E3E3), // Default border color
//                 width: 1.4,
//               ),
//             ),
//           ),
//         ),
//       ),
