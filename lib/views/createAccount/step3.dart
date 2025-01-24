import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/input_widgets/custom_password_field.dart';
import 'package:snad_box/widgets/custom_btn.dart';

class StepThree extends StatefulWidget {
  const StepThree({super.key});

  @override
  State<StepThree> createState() => _StepThreeState();
}

class _StepThreeState extends State<StepThree> {
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
      _isMaxLength = password.isEmpty ? null : password.length >= 8;
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
      appBar: AppBar(
        title: _buildHeader(),
        backgroundColor: kBgcolor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStepIndicator(),
            const SizedBox(height: 10),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildIntroText(),
                    const SizedBox(height: 20),
                    _buildPasswordForm(),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                    _buildCreateAccountButton(allConditionsMet),
                    const SizedBox(height: 20),
                    _buildLoginPrompt(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/o_logo.svg'),
      ],
    );
  }

  Widget _buildStepIndicator() {
    return Container(
      width: 90,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(32),
      ),
      child: const Center(
        child: Text('Step 3 of 3', style: kSmallBtnText),
      ),
    );
  }

  Widget _buildIntroText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Choose Your Password.', style: kHeaderText),
        SizedBox(height: 15),
        Text(
          'We want to recommend services based on \nyour location and also for your deliveries',
          style: kSubHeaderText,
        ),
      ],
    );
  }

  Widget _buildPasswordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPasswordField(
          label: 'Password',
          controller: _passwordController,
          onChanged: (password) {
            _validatePassword(password);
            _validatePasswordsMatch();
          },
        ),
        const SizedBox(height: 20),
        _buildPasswordField(
          label: 'Re-enter Password',
          controller: _confirmPasswordController,
          onChanged: (_) => _validatePasswordsMatch(),
        ),
        const SizedBox(height: 10),
        if (!_passwordsMatch && _confirmPasswordController.text.isNotEmpty)
          const Text(
            "Passwords do not match",
            style: TextStyle(color: Colors.red, fontSize: 14),
          ),
        const SizedBox(height: 10),
        _buildValidationRow("Capital letter", _hasCapitalLetter),
        const SizedBox(height: 10),
        _buildValidationRow("Alphanumeric character", _isAlphanumeric),
        const SizedBox(height: 10),
        _buildValidationRow("8 characters", _isMaxLength),
      ],
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required Function(String) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kFormLabelText),
        const SizedBox(height: 10),
        CustomPasswordInputField(
          controller: controller,
          hintText: label,
          onchanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildValidationRow(String text, bool? isValid) {
    Color iconColor;

    if (isValid == null) {
      iconColor = Colors.grey;
    } else if (isValid) {
      iconColor = const Color(0xff04c870);
    } else {
      iconColor = const Color(0xffbe1a0e);
    }

    return Row(
      children: [
        Icon(
          isValid == null
              ? Ionicons.checkmark_circle_outline
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

  Widget _buildCreateAccountButton(bool allConditionsMet) {
    return CustomButton(
      text: 'Create Account',
      enabled: allConditionsMet,
      onPressed: allConditionsMet ? () => print("Account Created!") : null,
    );
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? ', style: kSubHeaderText),
        InkWell(
          onTap: () {},
          child: const Text("Log In", style: kSubHeaderText2),
        ),
      ],
    );
  }
}
