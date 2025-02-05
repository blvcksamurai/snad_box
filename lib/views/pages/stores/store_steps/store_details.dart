import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:snad_box/widgets/input_widgets/custom_textfield.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/input_widgets/custom_input_field.dart';

class CreateStoreDetails extends StatefulWidget {
  const CreateStoreDetails({super.key});

  @override
  State<CreateStoreDetails> createState() => _CreateStoreDetailsState();
}

class _CreateStoreDetailsState extends State<CreateStoreDetails> {
  String? selectedState;
  String? selectedCategory;

  List<String> storeCategories = [
    'Appliances',
    'Electronics',
    'Devices',
    'Fashion',
    'Computing',
    'Food stuffs',
  ];

  void _showSearchableBottomSheet({
    required BuildContext context,
    required List<String> items,
    required Function(String) onSelect,
    required String title,
    String? searchHint,
  }) {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      isScrollControlled: true,
      backgroundColor: kBgcolor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        TextEditingController searchController = TextEditingController();
        List<String> filteredItems = List.from(items);

        return DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.6,
          maxChildSize: 0.8,
          expand: false,
          builder: (context, scrollController) {
            return StatefulBuilder(
              builder: (context, setState) {
                void filterItems(String query) {
                  setState(() {
                    filteredItems = items
                        .where((item) =>
                            item.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                  });
                }

                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 25, 16),
                      child: Column(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomInputField(
                            searchInput: true,
                            hintText: 'Search for your $searchHint',
                            controller: searchController,
                            onchanged: filterItems,
                            prefixIcon: const Icon(
                              Iconsax.search_normal_1,
                              color: Color(0xFF7D7D7D),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Color(0xFFE3E3E3)),
                    Expanded(
                      child: filteredItems.isNotEmpty
                          ? ListView.builder(
                              controller: scrollController,
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Center(
                                    child: Text(
                                      filteredItems[index],
                                      style: kItemListTextStyle,
                                    ),
                                  ),
                                  onTap: () {
                                    onSelect(filteredItems[index]);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            )
                          : const Center(
                              child: Text('No results found'),
                            ),
                    ),
                  ],
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildDropdown(
            context: context,
            label: 'Store Location',
            value: selectedState,
            hint: 'Choose state for your store',
            items: NigerianStatesAndLGA.allStates,
            onSelect: (state) {
              setState(() {
                selectedState = state;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildDropdown(
            context: context,
            label: 'Category',
            value: selectedCategory,
            hint: 'What category of products do you sell?',
            items: storeCategories,
            onSelect: (category) {
              setState(() {
                selectedCategory = category;
              });
            },
          ),
          const SizedBox(height: 16),
          _buildInputDescription()
        ],
      ),
    );
  }

  Column _buildInputDescription() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Store Description', style: kFormLabelText),
        SizedBox(height: 10),
        CustomTextfield(hintText: 'Write a description about your store.')
      ],
    );
  }

  Widget _buildDropdown({
    required BuildContext context,
    required String label,
    String? value,
    required String hint,
    required List<String> items,
    required Function(String) onSelect,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kFormLabelText),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            _showSearchableBottomSheet(
              context: context,
              items: items,
              searchHint: label.toLowerCase(),
              title: 'Choose your $label',
              onSelect: onSelect,
            );
          },
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE3E3E3), width: 2),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  value ?? hint,
                  style: value == null
                      ? kHintText
                      : const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                ),
                const Icon(
                  Iconsax.arrow_down_1,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
