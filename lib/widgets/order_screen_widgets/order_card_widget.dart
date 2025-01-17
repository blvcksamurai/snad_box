import 'package:flutter/material.dart';
import 'package:snad_box/widgets/order_screen_widgets/transaction_status_widget.dart';

import '../../utils/constants.dart';

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 100,
            width: 93,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: const DecorationImage(
                    image: AssetImage('assets/images/p_mockup.png'),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(width: 10),
          const SizedBox(
            width: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Best green tea juice bottle mockup',
                  overflow: TextOverflow.ellipsis,
                  style: kCartItemTitle,
                ),
                TransactionStatus(),
                CustomTimeStampAndPrice()
              ],
            ),
          ),
          const Expanded(child: Icon(Icons.arrow_forward, size: 20)),
        ],
      ),
    );
  }
}

class CustomTimeStampAndPrice extends StatelessWidget {
  const CustomTimeStampAndPrice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Text(
          'Today',
          style: kHintText,
        ),
        kSmallDot(),
        Text(
          '8:13 AM',
          style: kHintText,
        ),
        kSmallDot(),
        Text.rich(
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
        )
      ],
    );
  }
}

class kSmallDot extends StatelessWidget {
  const kSmallDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration:
          const BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}
