import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_btn.dart';
import '../widgets/input_widgets/custom_input_field.dart';

class TeabagStepTwo extends StatefulWidget {
  const TeabagStepTwo({super.key});

  @override
  State<TeabagStepTwo> createState() => _TeabagStepTwoState();
}

class _TeabagStepTwoState extends State<TeabagStepTwo> {
  String? selectedState; // To store the selected state
  String? selectedLGA; // To store the selected LGA

  void _showSearchableBottomSheet({
    required BuildContext context,
    required List<String> items,
    required Function(String) onSelect,
    required String title,
    String? c_search,
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
          initialChildSize: 0.6, // Default height: 60%
          minChildSize: 0.6, // Minimum height: 60%
          maxChildSize: 0.8, // Maximum height: 80%
          expand: false, // Allows snapping to sizes
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
                            hintText: 'Search for your $c_search',
                            controller: searchController,
                            onchanged: filterItems,
                            prefixIcon: const Icon(Iconsax.search_normal_1),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      color: Color(0xFFE3E3E3),
                    ),
                    Expanded(
                      child: filteredItems.isNotEmpty
                          ? ListView.builder(
                              controller: scrollController,
                              itemCount: filteredItems.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                  child: Column(
                                    children: [
                                      ListTile(
                                        title: Center(
                                          child: Text(filteredItems[index],
                                              style: kItemListTextStyle),
                                        ),
                                        onTap: () {
                                          onSelect(filteredItems[index]);
                                          Navigator.pop(context);
                                        },
                                      ),
                                      if (index < filteredItems.length - 1)
                                        const Divider(
                                          color: Color(0xFFE3E3E3),
                                        ), // Divider between items
                                    ],
                                  ),
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
                    const SizedBox(width: 10),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 90,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32)),
                  child: const Center(
                    child: Text(
                      'Step 2 of 3',
                      style: kSmallBtnText,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 382,
                  child: Text('Location Information.', style: kHeaderText),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                    width: 382,
                    child: Text(
                      'We want to recommend services based on \nyour location and also for your deliveries.',
                      style: kSubHeaderText,
                    )),
                const SizedBox(height: 20),
                SizedBox(
                    width: 382,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Address
                        const SizedBox(height: 10),
                        const Text('Address', style: kFormLabelText),
                        const SizedBox(height: 10),
                        CustomInputField(hintText: 'Enter your address'),

                        // Nigerian State dropdown
                        const SizedBox(height: 10),
                        const Text('State', style: kFormLabelText),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            _showSearchableBottomSheet(
                              context: context,
                              c_search: 'state',
                              items: NigerianStatesAndLGA.allStates,
                              title: 'Choose your State',
                              onSelect: (state) {
                                setState(() {
                                  selectedState = state;
                                  selectedLGA = null; // Reset LGA
                                });
                              },
                            );
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: const Color(0xFFE3E3E3), width: 2),
                                color: Colors.transparent),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedState ?? 'Choose your state',
                                  style: selectedState == null
                                      ? kHintText
                                      : const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                ),
                                const Icon(Iconsax.arrow_down_1,
                                    color: Colors.black), // Dropdown icon
                              ],
                            ),
                          ),
                        ),

                        // LGA dropdown
                        const SizedBox(height: 10),
                        const Text('LGA', style: kFormLabelText),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: selectedState == null
                              ? null
                              : () {
                                  _showSearchableBottomSheet(
                                    context: context,
                                    items: NigerianStatesAndLGA.getStateLGAs(
                                        selectedState!),
                                    c_search: 'local government',
                                    title: 'Choose your LGA',
                                    onSelect: (lga) {
                                      setState(() {
                                        selectedLGA = lga;
                                      });
                                    },
                                  );
                                },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                    color: const Color(0xFFE3E3E3), width: 2),
                                color: Colors.transparent),
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedLGA ?? 'Choose your LGA',
                                  style: selectedLGA == null
                                      ? kHintText
                                      : const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.black,
                                        ),
                                ),
                                const Icon(Iconsax.arrow_down_1,
                                    color: Colors.black), // Dropdown icon
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    )),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.2, // Responsive space
                ),
                CustomButton(
                  text: 'Next',
                ),
                SizedBox(
                  width: 382,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: kSubHeaderText,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Log In",
                          style: kSubHeaderText2,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20), // Add spacing before the button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
