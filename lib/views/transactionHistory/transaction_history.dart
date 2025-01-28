import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:snad_box/widgets/filter_and_search_widget.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/transaction_history_Item.dart';

class TransactionHistoryScreen extends StatefulWidget {
  const TransactionHistoryScreen({super.key});

  @override
  State<TransactionHistoryScreen> createState() =>
      _TransactionHistoryScreenState();
}

class _TransactionHistoryScreenState extends State<TransactionHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBgcolor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          // Static "Order History" row
          Container(
            // color: kBgcolor, // Background color for the header
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Transaction History',
                  style: kPageHeader,
                ),
              ],
            ),
          ),
          Flexible(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'YOUR SHOWCASE WALLET',
                    style: kPageSubHeader,
                  ),
                  //Showcase Wallet Balance
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: '₦ ',
                              style: TextStyle(
                                color: kHeaderTextColor,
                                fontSize: 28,
                                fontFamily: 'Nai',
                                fontWeight: FontWeight.bold,
                                height: 1.29,
                              )),
                          TextSpan(
                            text: '400,130.00',
                            style: kHeaderText,
                          )
                        ]),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Ionicons.eye_outline,
                            color: Colors.black,
                          ))
                    ],
                  ),
                  const SizedBox(height: 15),
                  CustomButton(text: 'Deposit'),
                  const SizedBox(height: 15),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TRANSACTION HISTORY',
                        style: kPageSubHeader,
                      ),
                      kFilterAndSearchIconWidget(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  //TODO: //ListView builder for the transaction history ListView
                  const TrasactionHistoryItem(
                    status: true,
                  ),
                  const TrasactionHistoryItem(
                    status: false,
                  ),
                  const TrasactionHistoryItem(
                    status: true,
                  ),
                  const TrasactionHistoryItem(
                    status: false,
                  ),
                  const TrasactionHistoryItem(
                    status: true,
                  ),
                  const TrasactionHistoryItem(
                    status: true,
                  ),
                  const TrasactionHistoryItem(
                    status: false,
                  ),
                  const TrasactionHistoryItem(
                    status: true,
                  ),
                  const TrasactionHistoryItem(
                    status: false,
                  ),
                  const TrasactionHistoryItem(
                    status: true,
                  ),
                  const TrasactionHistoryItem(
                    status: true,
                  ),
                  const TrasactionHistoryItem(
                    status: false,
                  ),
                  const TrasactionHistoryItem(
                    status: true,
                  ),
                  const TrasactionHistoryItem(
                    status: false,
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
