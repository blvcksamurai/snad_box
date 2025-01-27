import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snad_box/views/createAccount/step1.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_btn.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
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
                  const SizedBox(height: 15),
                  const SizedBox(
                    width: 382,
                    child: Text('Your shopping needs all in one place.',
                        style: kHeaderText),
                  ),
                  const SizedBox(height: 15),
                  const SizedBox(
                      width: 382,
                      child: Text(
                        'We take away the hassle from shopping and managing your store! Interface with our verified vendors.',
                        style: kSubHeaderText,
                      )),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StepOne(),
                        ),
                      );
                    },
                    text: 'Get Started',
                    icon: Icons.arrow_forward,
                    iconSize: 25,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * 0.45,
              child: SvgPicture.asset(
                'assets/images/illu_1.svg',
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
