import 'package:flutter/material.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/hero_card_tile.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order History',
                  style: kPageHeader,
                ),
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
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
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
                                      image: AssetImage(
                                          'assets/images/p_mockup.png'),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              width: 250,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Best green tea juice bottle mockup',
                                    overflow: TextOverflow.ellipsis,
                                    style: kCartItemTitle,
                                  ),
                                  Container(
                                    height: 30,
                                    width: 100,
                                    constraints: const BoxConstraints(
                                      minWidth: 0,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 3,
                                    ),
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFFFFF7EA),
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                            width: 1, color: Color(0xFFE3E3E3)),
                                        borderRadius: BorderRadius.circular(88),
                                      ),
                                    ),
                                    child: const Row(
                                      children: [
                                        Icon(
                                          Icons.radio_button_checked,
                                          color: kButtonColor,
                                        ),
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
                                  ),
                                  const Row(
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
                                  )
                                ],
                              ),
                            ),
                            const Expanded(
                                child: Icon(Icons.arrow_forward, size: 20)),
                          ],
                        ),
                      ),
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


//  List.generate(
//                     10, // Adjust to your number of items
//                     (index) => const Padding(
//                       padding: EdgeInsets.symmetric(vertical: 10),
//                       child: HeroCardTile(),
//                     ),
//                   ),