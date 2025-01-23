import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/input_widgets/custom_input_field.dart';
import 'package:nigerian_states_and_lga/nigerian_states_and_lga.dart';
import 'package:snad_box/widgets/input_widgets/custom_password_field.dart';

import '../../widgets/custom_btn.dart';

class TeabagStepThree extends StatefulWidget {
  const TeabagStepThree({super.key});

  @override
  State<TeabagStepThree> createState() => _TeabagStepThreeState();
}

class _TeabagStepThreeState extends State<TeabagStepThree> {
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
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 90,
                  height: 36,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(32)),
                  child: const Center(
                    child: Text(
                      'Step 3 of 3',
                      style: kSmallBtnText,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 382,
                  child: Text('Choose Your Password.', style: kHeaderText),
                ),
                const SizedBox(height: 15),
                const SizedBox(
                    width: 382,
                    child: Text(
                      'We want to recommend services based on \nyour location and also for your deliveries',
                      style: kSubHeaderText,
                    )),
                const SizedBox(height: 20),
                SizedBox(
                  width: 382,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),

                      //Password
                      const Text('Password', style: kFormLabelText),
                      const SizedBox(height: 10),

                      CustomPasswordInputField(
                        controller: _passwordController,
                        hintText: 'Password',
                        key: const ValueKey("passwordField"),
                        onchanged: (password) {
                          _validatePassword(password);
                          _validatePasswordsMatch();
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text('Re-enter Password', style: kFormLabelText),
                      const SizedBox(height: 10),
                      CustomPasswordInputField(
                        controller: _confirmPasswordController,
                        hintText: 'Re-enter Password',
                        key: const ValueKey("confirmPasswordField"),
                        onchanged: (_) {
                          _validatePasswordsMatch();
                        },
                      ),
                      const SizedBox(height: 10),
                      if (!_passwordsMatch &&
                          _confirmPasswordController.text.isNotEmpty)
                        const Text(
                          "Passwords do not match",
                          style: TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      const SizedBox(height: 10),
                      _buildValidationRow("Capital letter", _hasCapitalLetter),
                      const SizedBox(height: 10),
                      _buildValidationRow(
                          "Alphanumeric character", _isAlphanumeric),
                      const SizedBox(height: 10),
                      _buildValidationRow("8 characters", _isMaxLength),
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

  Widget _buildValidationRow(String text, bool? isValid) {
    Color iconColor;

    if (isValid == null) {
      iconColor = Colors.grey; // Default state
    } else if (isValid) {
      iconColor = const Color(0xff04c870); //valid state
    } else {
      iconColor = const Color(0xffbe1a0e); //invalid state
    }

    return Row(
      children: [
        Icon(
          isValid == null
              ? Ionicons.checkmark_circle_outline // Default icon
              : (isValid ? Ionicons.checkmark_circle : Ionicons.close_circle),
          color: iconColor,
          size: 22,
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1.33,
          ),
        ),
      ],
    );
  }
}
