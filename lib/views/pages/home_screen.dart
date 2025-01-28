import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:snad_box/services/api_service.dart';
import 'package:snad_box/utils/constants.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/for_you_items.dart';
import '../../widgets/hero_card_tile.dart';
import '../../widgets/large_text_with_icon.dart';
import '../../widgets/stores_card_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _buildHeader(),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              _buildGreeting(),
              const SizedBox(height: 20),
              //Items
              _buildForYouSection(),
              const SizedBox(height: 30),
              _buildStoresSection(),
              const SizedBox(height: 30),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: LargeTextWithIcon(headerTitle: 'Categories'),
              ),

              _buildCategoriesSection(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset('assets/images/o_logo.svg'),
          Row(
            children: [
              CustomIconButton(
                icon: Iconsax.search_normal_1,
                onPressed: () {},
              ),
              const SizedBox(width: 5),
              CustomIconButton(
                icon: Iconsax.shopping_cart,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGreeting() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('🌤️ Good Morning, Aise', style: kPageHeader),
          SizedBox(height: 10),
          Text('What are we getting you today?', style: kWelcomeMessage),

          //Hero Card
          HeroCardTile(),
        ],
      ),
    );
  }

  Widget _buildForYouSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LargeTextWithIcon(
            headerTitle: 'For You',
            onPressed: () {},
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 232,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: ForYouItems(
                  title: 'Mockup Water Bottle',
                  price: 4130,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStoresSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LargeTextWithIcon(headerTitle: 'Stores'),
          const SizedBox(height: 15),
          FutureBuilder(
            future: apiService.fetchData('store/brand'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const SizedBox(
                  height: 180,
                  child: Center(
                      child: CircularProgressIndicator(color: kButtonColor)),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final data = snapshot.data as Map<String, dynamic>;
                final brandStores =
                    data['data']['brandStores'] as List<dynamic>;

                return SizedBox(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brandStores.length,
                    itemBuilder: (context, index) {
                      final store = brandStores[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: StoresCardItem(
                          name: store['title'],
                          rating: store['rating'],
                        ),
                      );
                    },
                  ),
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return const Padding(
        padding: EdgeInsets.only(right: 10, left: 20, top: 20),
        child: Wrap(
          spacing: 10.0, // Space between each item
          runSpacing: 10.0, // Space between the rows
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            CategoriesButtonWidget(
              categoryName: '📺 Appliances',
            ),
            CategoriesButtonWidget(
              categoryName: '😋 Food Stuffs',
            ),
            CategoriesButtonWidget(
              categoryName: '📱Devices',
            ),
            CategoriesButtonWidget(
              categoryName: '💡 Electronics',
            ),
            CategoriesButtonWidget(
              categoryName: '👔 Fashion',
            ),
            CategoriesButtonWidget(
              categoryName: '💻 Computing',
            ),
          ],
        ));
  }
}

class CategoriesButtonWidget extends StatelessWidget {
  final String categoryName;

  const CategoriesButtonWidget({
    super.key,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          height: 30,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          constraints: const BoxConstraints(
            minWidth: 1,
            maxWidth: double.infinity,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(72)),
            color: kIconButtonColor,
          ),
          child: Text(
            categoryName,
            style: kCategoriesTextStyle,
          )),
    );
  }
}
//           final categories = [
        //             {'name': ' Appliances', 'emoji': '📺'},
        //             {'name': ' Food Stuffs', 'emoji': '🍎'},
        //             {'name': ' Devices', 'emoji': '📱'},
        //             {'name': ' Electronics', 'emoji': '🔌'},
        //             {'name': ' Fashion', 'emoji': '👗'},
        //             {'name': ' Computing', 'emoji': '💻'},
        //           ];