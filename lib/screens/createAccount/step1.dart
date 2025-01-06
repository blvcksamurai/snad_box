import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_input_field.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

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
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 90,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32)),
                  child: const Center(
                    child: Text(
                      'Step 1 of 3',
                      style: kSmallBtnText,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 382,
                  child: Text('Create Your Account.', style: kHeaderText),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                    width: 382,
                    child: Text(
                      'Let us create your account for you by getting some basic information',
                      style: kSubHeaderText,
                    )),
                const SizedBox(height: 20),
                SizedBox(
                    width: 382,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('First Name',
                                      style: kFormLabelText),
                                  const SizedBox(height: 10),
                                  CustomInputField(
                                    hintText: 'Enter your first name',
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Last Name',
                                      style: kFormLabelText),
                                  const SizedBox(height: 10),
                                  CustomInputField(
                                    hintText: 'Enter your last name',
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        //Email Address
                        const SizedBox(height: 10),
                        const Text('Email Address', style: kFormLabelText),
                        const SizedBox(height: 10),
                        CustomInputField(hintText: 'Enter your email address'),
                        //Phone Number
                        const SizedBox(height: 10),
                        const Text('Phone Number', style: kFormLabelText),
                        const SizedBox(height: 10),
                        CustomInputField(hintText: 'Enter your phone number'),

                        //User name
                        const SizedBox(height: 10),
                        const Text('Username', style: kFormLabelText),
                        const SizedBox(height: 10),
                        CustomInputField(hintText: '@starboytins'),

                        const SizedBox(height: 20),
                      ],
                    )),
                const SizedBox(height: 40), // Add spacing before the button

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
