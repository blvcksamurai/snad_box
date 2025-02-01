import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/custom_icon_button.dart';
import 'package:snad_box/widgets/product_app_bar.dart';

class StoreDetailsScreen extends StatefulWidget {
  const StoreDetailsScreen({super.key});

  @override
  State<StoreDetailsScreen> createState() => _StoreDetailsScreenState();
}

class _StoreDetailsScreenState extends State<StoreDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: kBgcolor,
            expandedHeight: 260.0,
            pinned: true,
            stretch: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Calculating the collapse percentage
                double collapsePercentage =
                    (constraints.maxHeight - kToolbarHeight) /
                        (260.0 - kToolbarHeight);

                // Interpolating left padding and bottom padding based on collapse percentage
                double leftPadding = (20 + (80 - 20) * (1 - collapsePercentage))
                    .clamp(0, double.infinity);
                double bottomPadding = (10 + (0 - 0) * (1 - collapsePercentage))
                    .clamp(0, double.infinity);
                return FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: Stack(
                    children: [
                      // Cover Photo
                      SizedBox(
                        height: 150,
                        width: double.infinity,
                        child: Image.asset(
                          'assets/images/nike_cover.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      // Profile Picture
                      Positioned(
                        top: 110.0,
                        left: 20.0,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(width: 2, color: kIconButtonColor),
                              image: const DecorationImage(
                                  image: AssetImage('assets/images/nike.png')),
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),
                    ],
                  ),
                  title: const Text(
                    "Nike Fashion Store",
                    style: kSubHeaderText2,
                  ),
                  titlePadding:
                      EdgeInsets.only(left: leftPadding, bottom: bottomPadding),
                );
              },
            ),
            leading: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ProductNaviIcon(icon: Icons.arrow_back, onTap: () {}),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ProductNaviIcon(icon: Iconsax.send_2, onTap: () {}),
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        StoreTagItem(
                          label: '4.3',
                          icon: Iconsax.star,
                        ),
                        StoreTagItem(
                          label: 'Lagos',
                          icon: Iconsax.location,
                        ),
                        StoreTagItem(
                          label: 'Fashion',
                          icon: Iconsax.cloud,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}

class StoreTagItem extends StatelessWidget {
  final String label;
  final IconData icon;

  const StoreTagItem({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        constraints: const BoxConstraints(
          minWidth: 1,
          maxWidth: double.infinity,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: Color(0xFFFFECCC),
        ),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 5),
            Text(
              label,
              style: kFormLabelText,
            )
          ],
        ),
      ),
    );
  }
}
