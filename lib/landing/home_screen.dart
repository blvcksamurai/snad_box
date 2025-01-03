import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snad_box/constants.dart';

import '../widgets/custom_btn.dart';
import '../widgets/custom_otp_input.dart';

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
                    const SizedBox(width: 10),
                  ],
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 382,
                  child: Text('OTP Confirmation', style: kHeaderText),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                    width: 332,
                    child: Text(
                      'We sent you a 6 digit OTP to your email. Enter it to confirm your email address',
                      style: kSubHeaderText,
                    )),
                const SizedBox(height: 20),
                const SizedBox(
                  width: 382,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      // SizedBox(
                      //   height: 70, // Height of the items
                      //   child: ListView.builder(
                      //     scrollDirection: Axis
                      //         .horizontal, // Set the scroll direction to horizontal
                      //     itemCount: 6,
                      //     itemBuilder: (context, index) {
                      //       return Padding(
                      //         padding: const EdgeInsets.symmetric(
                      //             horizontal: 8.0), // Add spacing between items
                      //         child: SizedBox(
                      //           height: 70,
                      //           width: 57,
                      //           child: CustomInputField(hintText: '0'),
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // )

                      Form(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomOTPInput(),
                          CustomOTPInput(),
                          CustomOTPInput(),
                          CustomOTPInput(),
                          CustomOTPInput(),
                          CustomOTPInput(),
                        ],
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Confirm Email Address',
                  onPressed: () {},
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: 382,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't get a code? ",
                        style: kSubHeaderText,
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Request Code",
                          style: kSubHeaderText2,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.15, // Responsive space
                ),
                SvgPicture.asset('assets/images/planes.svg'),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
