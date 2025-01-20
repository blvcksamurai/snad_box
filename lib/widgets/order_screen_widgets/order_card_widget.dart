import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../custom_time_stamp.dart';
import 'transaction_status_widget.dart';

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
