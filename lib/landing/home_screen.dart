import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snad_box/constants.dart';
import 'package:snad_box/widgets/custom_input_field.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';

import '../widgets/custom_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectedState; // To store the selected state
  String? selectedLGA; // To store the selected LGA

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
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
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
                      'We want to recommend services based on your location and also for your deliveries',
                      style: kSubHeaderText,
                    )),
                const SizedBox(height: 20),
                SizedBox(
                    width: 382,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Address
                        const SizedBox(height: 10),
                        const Text('Address', style: kFormLabelText),
                        const SizedBox(height: 10),
                        const CustomInputField(hintText: 'Enter your address'),
                        //Nigerian State drop down
                        const SizedBox(height: 10),
                        const Text('State', style: kFormLabelText),
                        const SizedBox(height: 10),

                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: const Color(0xFFE3E3E3), width: 2),
                              color: Colors.transparent),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButton<String>(
                            key: const ValueKey('StatesDropdown'),
                            value: selectedState,
                            isExpanded: true,
                            underline:
                                const SizedBox(), // Removes the default underline
                            hint: const Text(
                              'Select your state',
                              style: kHintText,
                            ),
                            items: [
                              for (var state in NigerianStatesAndLGA.allStates)
                                DropdownMenuItem(
                                  value: state,
                                  child: Text(state),
                                ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedState = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        //User name
                        const SizedBox(height: 10),
                        const Text('LGA', style: kFormLabelText),
                        const SizedBox(height: 10),
// LGA Dropdown
                        Container(
                          height: 56,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: const Color(0xFFE3E3E3), width: 2),
                            color: Colors.transparent,
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: DropdownButton<String>(
                            key: const ValueKey('LGADropdown'),
                            value: selectedLGA,
                            isExpanded: true,
                            underline: const SizedBox(),
                            hint: const Text('Select an LGA', style: kHintText),
                            items: selectedState == null
                                ? [] // Show no items if no state is selected
                                : [
                                    for (var lga
                                        in NigerianStatesAndLGA.getStateLGAs(
                                            selectedState!))
                                      DropdownMenuItem(
                                        value: lga,
                                        child: Text(lga),
                                      ),
                                  ],
                            onChanged: (value) {
                              setState(() {
                                selectedLGA = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    )),
                const SizedBox(height: 40), // Add spacing before the button

                const CustomButton(),
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
