import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:snad_box/utils/constants.dart';
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Profile',
                style: kPageHeader,
              ),
              const SizedBox(height: 10),
              const Text(
                'YOUR SHOWCASE WALLET',
                style: kPageSubHeader,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'N 400,130.00',
                    style: kHeaderText,
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
              const SizedBox(
                height: 10,
              ),
              // TODO: Use a ListTile here later
              const SettingOption(),
              const SettingOption(),
              const SettingOption(),
              const SettingOption(),
              const SettingOption(),
            ],
          ),
        ),
      )),
    );
  }
}

class SettingOption extends StatelessWidget {
  const SettingOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Iconsax.user_square,
                  size: 24,
                ),
                SizedBox(width: 5),
                Text(
                  'Transaction History',
                  style: kSettingLabel,
                ),
              ],
            ),
            Icon(Icons.arrow_forward_ios_rounded)
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Divider(
          thickness: 0.5,
        ),
      ],
    );
  }
}
