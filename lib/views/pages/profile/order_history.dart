import 'package:flutter/material.dart';
import 'package:snad_box/utils/constants.dart';

import '../../../widgets/filter_and_search_widget.dart';
import '../../../widgets/order_screen_widgets/order_card_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBgcolor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order History',
                  style: kPageHeader,
                ),
                kFilterAndSearchIconWidget(),
              ],
            ),
          ),

          // Scrollable content
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: List.generate(
                    10, // Adjust to your number of items
                    (index) => const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: OrderItemCard(),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//  List.generate(
//                     10, // Adjust to your number of items
//                     (index) => const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: HeroCardTile(),
//                     ),
//                   ),