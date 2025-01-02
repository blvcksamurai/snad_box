import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:snad_box/constants.dart';
import 'package:snad_box/widgets/custom_input_field.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:snad_box/widgets/custom_password_field.dart';

import '../widgets/custom_btn.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool? _hasCapitalLetter;
  bool? _isAlphanumeric;
  bool? _isMaxLength;
  bool _passwordsMatch = false;

  void _validatePassword(String password) {
    setState(() {
      _hasCapitalLetter =
          password.isEmpty ? null : password.contains(RegExp(r'[A-Z]'));
      _isAlphanumeric = password.isEmpty
          ? null
          : password.contains(RegExp(r'[a-zA-Z]')) &&
              password.contains(RegExp(r'[0-9]'));
      _isMaxLength =
          password.isEmpty ? null : password.length >= 8; // Fixed condition
    });
  }

  void _validatePasswordsMatch() {
    setState(() {
      _passwordsMatch =
          _passwordController.text == _confirmPasswordController.text &&
              _passwordController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool allConditionsMet = (_hasCapitalLetter ?? false) &&
        (_isAlphanumeric ?? false) &&
        (_isMaxLength ?? false) &&
        _passwordsMatch;

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
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.2, // Responsive space
                ),
                CustomButton(
                  text: 'Create Account',
                  enabled: allConditionsMet,
                  onPressed: allConditionsMet
                      ? () {
                          // Button logic
                          print("Account Created!");
                        }
                      : null,
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
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
