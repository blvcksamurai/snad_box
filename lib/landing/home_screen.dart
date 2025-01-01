import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snad_box/constants.dart';
import 'package:snad_box/widgets/custom_input_field.dart';

import '../widgets/custom_btn.dart';

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
                      'Let us create your account for you by getting some basic information',
                      style: kSubHeaderText,
                    )),
                const SizedBox(height: 20),
                const SizedBox(
                    width: 382,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Email Address
                        SizedBox(height: 10),
                        Text('Email Address', style: kFormLabelText),
                        SizedBox(height: 10),
                        CustomInputField(hintText: 'Enter your email address'),
                        //Phone Number
                        SizedBox(height: 10),
                        Text('Phone Number', style: kFormLabelText),
                        SizedBox(height: 10),
                        CustomInputField(hintText: 'Enter your phone number'),

                        //User name
                        SizedBox(height: 10),
                        Text('Username', style: kFormLabelText),
                        SizedBox(height: 10),
                        CustomInputField(hintText: '@starboytins'),

                        SizedBox(height: 20),
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
