import 'package:flutter/material.dart';
import 'package:snad_box/widgets/custom_btn.dart';

import '../../utils/constants.dart';

class CartTotalFAB extends StatelessWidget {
  const CartTotalFAB({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: kBgcolor,
        border: Border(
          top: BorderSide(
            color: Colors.grey, // Change to desired color
            width: 1.0, // Change to desired width
          ),
        ),
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total'),
              Text('N4130'),
            ],
          ),
          const SizedBox(height: 15),
          CustomButton(text: 'Continue to Shopping'),
        ],
      ),
    );
  }
}
