import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/views/pages/profile/favourites_screen.dart';
import 'package:snad_box/views/pages/profile/order_history.dart';
import 'package:snad_box/views/pages/profile/your_profile.dart';
import 'package:snad_box/views/transactionHistory/transaction_history.dart';
import 'package:snad_box/widgets/custom_btn.dart';
import 'package:snad_box/widgets/hero_card_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    bool isStoreOwner = true;
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Profile',
          style: kPageHeader,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'YOUR SHOWCASE WALLET',
                    style: kPageSubHeader,
                  ),
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
                  Visibility(
                    visible: isStoreOwner,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'YOUR STORE',
                          style: kPageSubHeader,
                        ),
                        HeroCardTile(
                          bigText: 'Attend to your Orders',
                          smallText:
                              'Head over to your store and get to fulfilling order requests.',
                          buttonContent: 'Go to Store Dashboard',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'GENERAL SETTINGS',
                    style: kPageSubHeader,
                  ),
                  const SizedBox(height: 16),
                  // TODO: Use a ListTile here later
                  SettingOption(
                    icon: Iconsax.profile_circle,
                    title: 'Your Profile',
                    route: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const YourProfileScreen()));
                    },
                  ),
                  SettingOption(
                    icon: Iconsax.money_2,
                    title: 'Transaction History',
                    route: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const TransactionHistoryScreen()));
                    },
                  ),
                  SettingOption(
                    icon: Iconsax.truck,
                    title: 'Order History',
                    route: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const OrderHistoryScreen()));
                    },
                  ),
                  SettingOption(
                    icon: Iconsax.heart,
                    title: 'My Favourites',
                    route: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FavouritesScreen()));
                    },
                  ),
                  SettingOption(
                    icon: Iconsax.notification_bing,
                    title: 'Notification Settings',
                    route: () {},
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class SettingOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback route;

  const SettingOption({
    super.key,
    required this.icon,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: route,
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    title,
                    style: kSettingLabel,
                  ),
                ],
              ),
              const Icon(Icons.arrow_forward_ios_rounded)
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          const Divider(
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}
