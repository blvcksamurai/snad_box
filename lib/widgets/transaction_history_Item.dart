import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../utils/constants.dart';
import 'custom_time_stamp.dart';

class TrasactionHistoryItem extends StatelessWidget {
  final bool status;
  const TrasactionHistoryItem({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: status ? kIconButtonColor2 : kStatus2,
                ),
                alignment: Alignment.center,
                child: Transform.rotate(
                  angle: status ? 0.7854 : -2.3562,
                  child: Icon(
                    Iconsax.arrow_down,
                    color: status ? kArrowColor1 : kArrowColor2,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 210,
                      child: Text(
                        'Priest and Sons Ltd',
                        style: kTranDetail,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  CustomTimeStampAndPrice(
                    isPrice: false,
                  ),
                ],
              )
            ],
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: status ? '+₦ ' : '-₦ ',
                style: TextStyle(
                  color: status ? kPStatus1 : kPStatus2,
                  fontSize: 14,
                  fontFamily: 'Nai',
                  fontWeight: FontWeight.bold,
                  height: 1.43,
                ),
              ),
              TextSpan(
                text: '413,000',
                style: TextStyle(
                  color: status ? kPStatus1 : kPStatus2,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  height: 1.43,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
