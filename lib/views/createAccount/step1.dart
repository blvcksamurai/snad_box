import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:snad_box/views/createAccount/step2.dart';

import '../../utils/constants.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/input_widgets/custom_input_field.dart';

class StepOne extends StatefulWidget {
  const StepOne({super.key});

  @override
  State<StepOne> createState() => _StepOneState();
}

class _StepOneState extends State<StepOne> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for each field
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when no longer needed
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  void _handleNext() {
    if (_formKey.currentState?.validate() ?? false) {
      // Navigate to the next page
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const StepTwo(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBgcolor,
        title: _buildHeader(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: _buildStepIndicator(),
          ),
          Flexible(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildIntroText(),
                      const SizedBox(height: 20),
                      _buildForm(),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: 'Next',
                        onPressed: _handleNext,
                      ),
                      const SizedBox(height: 20),
                      _buildLoginPrompt(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
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
                controller: _firstNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'First Name is required';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildInputField(
                label: 'Last Name',
                hintText: 'Enter your last name',
                controller: _lastNameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Last Name is required';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildInputField(
          label: 'Email Address',
          hintText: 'Enter your email address',
          controller: _emailController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Email is required';
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return 'Please enter a valid Email address';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        _buildInputField(
          label: 'Phone Number',
          hintText: 'Enter your phone number',
          controller: _phoneNumberController,
          keyboardType: TextInputType.phone,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Phone Number is required';
            }

            //more conditionals
            if (value.length < 10) {
              return 'Enter a valid phone number';
            }
            if (value.length > 11) {
              return 'Phone number cannot exceed 11 characters';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        _buildInputField(
          label: 'Username',
          hintText: '@starboytins',
          controller: _usernameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Username is required';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    TextEditingController? controller,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: kFormLabelText),
        const SizedBox(height: 10),
        CustomInputField(
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          hintText: hintText,
        ),
      ],
    );
  }

  Widget _buildLoginPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Already have an account? ', style: kSubHeaderText),
        GestureDetector(
          onTap: () {},
          child: const Text('Log In', style: kSubHeaderText2),
        ),
      ],
    );
  }
}
