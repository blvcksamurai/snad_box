import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/constants.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/hero_card_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/o_logo.svg'),
                    SizedBox(
                      width: 90,
                      height: 40,
                      child: Row(
                        children: [
                          const SizedBox(width: 5),
                          CustomIconButton(
                            icon: Iconsax.search_normal_1,
                            onPressed: () {},
                          ),
                          const SizedBox(width: 5),
                          CustomIconButton(
                            icon: Iconsax.shopping_cart,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                //Welcome message
                const SizedBox(
                  width: 382,
                  child: Text('🌤️ Good Morning, Aise', style: kGreeting),
                ),
                const SizedBox(height: 10),
                const SizedBox(
                    width: 332,
                    child: Text(
                      'What are we getting you today?',
                      style: kWelcomeMessage,
                    )),
                const SizedBox(height: 20),

                //Hero Card
                const HeroCardTile(),
                const SizedBox(height: 20),
                //For You
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'For You',
                      style: kBigTextStyle,
                    ),
                    CustomIconButton(
                      icon: Icons.arrow_forward_ios,
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.15, // Responsive space
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
