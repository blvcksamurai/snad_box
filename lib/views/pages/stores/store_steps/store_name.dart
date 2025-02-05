import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/input_widgets/custom_input_field.dart';

class CreateStoreName extends StatefulWidget {
  const CreateStoreName({super.key});

  @override
  State<CreateStoreName> createState() => _CreateStoreNameState();
}

class _CreateStoreNameState extends State<CreateStoreName> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
              child: Column(
            children: [
              _buildInputField(
                  label: 'Store Name',
                  hintText: 'Enter the name for your store'),
              const SizedBox(height: 16),
              _buildInputField(
                  label: 'Store CAC - optional',
                  hintText: 'Enter the CAC for your store',
                  keyboardType: TextInputType.number)
            ],
          ))
        ],
      ),
    );
  }
}

Widget _buildInputField({
  required String label,
  required String hintText,
  TextEditingController? controller,
  TextInputType? keyboardType,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: kFormLabelText),
      const SizedBox(height: 10),
      CustomInputField(
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        hintText: hintText,
      ),
    ],
  );
}
