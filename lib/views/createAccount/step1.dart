import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/input_widgets/custom_input_field.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildStepIndicator(),
                const SizedBox(height: 20),
                _buildIntroText(),
                const SizedBox(height: 20),
                _buildForm(),
                const SizedBox(height: 40),
                _buildNextButton(),
                const SizedBox(height: 20),
                _buildLoginPrompt(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset('assets/images/o_logo.svg'),
        const SizedBox(width: 10),
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
        child: Text(
          'Step 1 of 3',
          style: kSmallBtnText,
        ),
      ),
    );
  }

  Widget _buildIntroText() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Create Your Account.', style: kHeaderText),
        SizedBox(height: 15),
        Text(
          'Let us create your account for you by getting some basic information',
          style: kSubHeaderText,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildInputField(
                label: 'First Name',
                hintText: 'Enter your first name',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildInputField(
                label: 'Last Name',
                hintText: 'Enter your last name',
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildInputField(
            label: 'Email Address', hintText: 'Enter your email address'),
        const SizedBox(height: 10),
        _buildInputField(
            label: 'Phone Number', hintText: 'Enter your phone number'),
        const SizedBox(height: 10),
        _buildInputField(label: 'Username', hintText: '@starboytins'),
      ],
    );
  }

  Widget _buildInputField({required String label, required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kFormLabelText),
        const SizedBox(height: 10),
        CustomInputField(
          hintText: hintText,
        ),
      ],
    );
  }

  Widget _buildNextButton() {
    return CustomButton(text: 'Next');
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? ', style: kSubHeaderText),
        InkWell(
          onTap: () {},
          child: const Text('Log In', style: kSubHeaderText2),
        ),
      ],
    );
  }
}
