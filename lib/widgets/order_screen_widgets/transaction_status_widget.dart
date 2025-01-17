import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class TransactionStatus extends StatelessWidget {
  const TransactionStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      constraints: const BoxConstraints(
        minWidth: 0,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFF7EA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFE3E3E3)),
          borderRadius: BorderRadius.circular(88),
        ),
      ),
      child: const Row(
        children: [
          TransactionStatusRadio(),
          SizedBox(width: 5),
          Text(
            'Pending',
            style: TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 13,
              fontWeight: FontWeight.w500,
              height: 1.50,
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionStatusRadio extends StatelessWidget {
  const TransactionStatusRadio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //outer circle
      width: 16,
      height: 16,
      decoration:
          const BoxDecoration(color: kPendingOuter, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Container(
        //inner circle
        height: 8,
        width: 8,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kPending,
        ),
      ),
    );
  }
}
