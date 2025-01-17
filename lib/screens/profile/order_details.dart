import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/hero_card_tile.dart';
import 'package:snad_box/widgets/order_screen_widgets/transaction_status_widget.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({super.key});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  int selectedIndex = 0;

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Static "Order Details" header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order Details',
                  style: kPageHeader,
                ),
              ],
            ),
          ),

          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 86,
                      height: 86,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/p_mockup.png'),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(
                        width: 382,
                        height: 64,
                        child: Text(
                          'Best green tea juice bottle mockup',
                          style: kProductName,
                        )),
                    const SizedBox(height: 10),
                    const Text.rich(
                      TextSpan(children: [
                        TextSpan(
                          text: '₦ ',
                          style: TextStyle(
                            color: Color(0xFF7D7D7D),
                            fontSize: 18,
                            fontFamily: 'Nai',
                            fontWeight: FontWeight.w400,
                            height: 1.50,
                          ),
                        ),
                        TextSpan(
                          text: '413,000,000',
                          style: kItemListTextStyle,
                        ),
                      ]),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 0;
                              print(selectedIndex);
                            });
                          },
                          child: Container(
                            width: 158,
                            height: 32,
                            decoration: BoxDecoration(
                                color: selectedIndex == 0
                                    ? kIconButtonColor2
                                    : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(32)),
                                border: Border.all(
                                  width: 1,
                                  color: selectedIndex == 0
                                      ? kIconButtonColor2
                                      : kGrey,
                                )),
                            alignment: Alignment.center,
                            child: const Text(
                              'Transaction Details',
                              style: kFormLabelText,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = 1;
                              print(selectedIndex);
                            });
                          },
                          child: Container(
                            width: 158,
                            height: 32,
                            decoration: BoxDecoration(
                                color: selectedIndex == 1
                                    ? kIconButtonColor2
                                    : Colors.transparent,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(32)),
                                border: Border.all(
                                  width: 1,
                                  color: selectedIndex == 1
                                      ? kIconButtonColor2
                                      : kGrey,
                                )),
                            alignment: Alignment.center,
                            child: const Expanded(
                              child: Text(
                                'Transaction Timeline',
                                style: kFormLabelText,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //Tabbar Views
                    const SizedBox(height: 20),
                    selectedIndex == 0
                        ?
                        //Transaction Details
                        const TransactionDetailsTab()
                        : const TransactionTimelineTab()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TransactionTimelineTab extends StatelessWidget {
  const TransactionTimelineTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TransactionTimelineItem(),
        SizedBox(height: 10),
        TransactionTimelineItem(),
        SizedBox(height: 10),
        TransactionTimelineItem(),
        SizedBox(height: 10),
        TransactionTimelineItem()
      ],
    );
  }
}

class TransactionTimelineItem extends StatelessWidget {
  const TransactionTimelineItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children: [
          Icon(
            Ionicons.checkmark_circle,
            size: 30,
            color: Color(0xFF039754),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order Received',
                style: kFormLabelText,
              ),
              Text(
                '12:22 PM',
                style: kTranTimeline,
              )
            ],
          )
        ],
      ),
    );
  }
}

class TransactionDetailsTab extends StatelessWidget {
  const TransactionDetailsTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TransactionTitleHeader(
          title: 'Transaction Status',
        ),
        SizedBox(height: 10),
        TransactionStatus(),
        SizedBox(height: 10),
        TransactionTitleAndDescription(
          title: 'Store Name',
          desc: 'Priest and Sons Ltd',
        ),

        SizedBox(height: 10),
        TransactionTitleAndDescription(
          title: 'Date and Time',
          desc: 'Tuesday, 4th of June 2024. 4:13AM',
        ),
        SizedBox(height: 10),

        TransactionTitleAndDescription(
          title: 'Transaction Type',
          desc: 'Deposit',
        ),
        SizedBox(height: 10),

        TransactionTitleHeader(title: 'Amount Paid'),
        SizedBox(height: 10),
        Text.rich(TextSpan(children: [
          TextSpan(
            text: '₦ ',
            style: TextStyle(
              color: Color(0xFF0A0A0A),
              fontSize: 16,
              fontFamily: 'Nai',
              fontWeight: FontWeight.bold,
              height: 1.50,
            ),
          ),
          TextSpan(text: '413,000,000', style: kTranDetail)
        ])),
        SizedBox(height: 10),
        TransactionTitleAndDescription(
          title: 'Destination',
          desc: 'Showcase Wallet',
        ),

        SizedBox(height: 10),
        TransactionTitleAndDescription(
          title: 'Transaction ID',
          desc: 'SHWCSE ID 090-413-0013',
        ),

        // HeroCardTile(),
        // HeroCardTile(),
        // HeroCardTile(),
        // HeroCardTile(),
        // HeroCardTile(),
      ],
    );
  }
}

class TransactionTitleAndDescription extends StatelessWidget {
  final String title, desc;

  const TransactionTitleAndDescription({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TransactionTitleHeader(title: title),
        const SizedBox(height: 10),
        TransactionTitle(
          desc: desc,
        ),
      ],
    );
  }
}

class TransactionTitle extends StatelessWidget {
  final String desc;

  const TransactionTitle({
    super.key,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      desc,
      style: kTranDetail,
    );
  }
}

class TransactionTitleHeader extends StatelessWidget {
  final String title;
  const TransactionTitleHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: kTranHeaderTitle,
    );
  }
}
