import 'package:flutter/material.dart';
import 'package:snad_box/widgets/small_dot.dart';

import '../utils/constants.dart';

class CustomTimeStampAndPrice extends StatelessWidget {
  final bool isPrice;
  const CustomTimeStampAndPrice({
    super.key,
    this.isPrice = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Today',
          style: kHintText,
        ),
        const kSmallDot(),
        const Text(
          '8:13 AM',
          style: kHintText,
        ),
        Visibility(visible: isPrice, child: const kSmallDot()),
        Visibility(
          visible: isPrice,
          child: const Text.rich(
            TextSpan(children: [
              TextSpan(
                text: '₦',
                style: TextStyle(
                  color: Color(0xFF7D7D7D),
                  fontSize: 14,
                  fontFamily: 'Nai',
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
              TextSpan(
                text: '4,130',
                style: kHintText,
              )
            ]),
          ),
        )
      ],
    );
  }
}
