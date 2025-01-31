import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pinput/pinput.dart';
import 'package:snad_box/utils/constants.dart';
import 'package:snad_box/widgets/custom_drag_handle.dart';

import '../../widgets/custom_btn.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final TextEditingController _otpController = TextEditingController();
  late ConfettiController _confettiController;
  Timer? _timer;
  int _start = 30; // Cooldown duration (in seconds)
  bool _canResend = false; // Disable "Resend" button initially
  String? _errorMessage; // To store error messages

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _startTimer();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() => _canResend = false);
    _start = 30; // Reset timer
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start == 0) {
        setState(() {
          _canResend = true; // Enable "Resend OTP" button
          _timer?.cancel();
        });
      } else {
        setState(() => _start--);
      }
    });
  }

  void _resendOtp() {
    print("OTP Resent!");
    _startTimer(); // Restart cooldown
  }

  void _submitOtp(String otp) {
    const String correctOtp = '000000'; // Default acceptable OTP

    if (otp == correctOtp) {
      // Valid OTP: Show success modal
      //TODO: Add Confetti to the modal
      _confettiController.play(); // Start confetti when modal pops
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return _AnimatedSuccessModal(
                confettiController: _confettiController);
          });
    } else {
      // Invalid OTP: Show error message below OTP field
      setState(() {
        _errorMessage = "OTP is incorrect. Please request a new one.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgcolor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
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
                    width: double.infinity,
                    child: Text(
                      'We sent you a 6 digit OTP to your email. Enter it to confirm your email address',
                      style: kSubHeaderText,
                    )),
                const SizedBox(height: 20),

                /// OTP Input Field
                Center(
                  child: Column(
                    children: [
                      Pinput(
                        keyboardType: TextInputType.number,
                        length: 6,
                        controller: _otpController,
                        defaultPinTheme: PinTheme(
                          width: 57,
                          height: 70,
                          textStyle: kOTPActive,
                          decoration: BoxDecoration(
                            border: Border.all(color: kGrey, width: 1.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        focusedPinTheme: PinTheme(
                          width: 57,
                          height: 70,
                          textStyle: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: kButtonColor, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onCompleted: _submitOtp,
                      ),
                      if (_errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Iconsax.info_circle,
                                color: Colors.red,
                                size: 16,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _errorMessage!,
                                  style: const TextStyle(
                                    color: Color(0xFFFB4337),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 1.50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                CustomButton(
                  text: 'Confirm Email Address',
                  onPressed: () => _submitOtp(_otpController.text),
                ),
                const SizedBox(height: 15),
                Center(
                  child: SizedBox(
                    width: 382,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _canResend ? "Didn't get a code? " : "Code sent. ",
                          style: kSubHeaderText,
                        ),
                        Text(
                          _canResend ? "" : "Request New Code in ",
                          style: kOtpsubheaderText2,
                        ),
                        InkWell(
                          onTap: _canResend
                              ? _resendOtp
                              : null, // Disable if cooldown is active
                          child:
                              Text(_canResend ? "Request code" : " 00:$_start",
                                  style: TextStyle(
                                    color: _canResend
                                        ? Colors.black
                                        : Colors.black, // Grey when disabled
                                    fontFamily: 'Gsa',
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    height: 1.3,
                                  )),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.15, // Responsive space
                ),
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.35,
                  child: Center(
                      child: SvgPicture.asset(
                    'assets/images/planes.svg',
                    fit: BoxFit.contain,
                  )),
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

class _AnimatedSuccessModal extends StatefulWidget {
  final ConfettiController confettiController;

  const _AnimatedSuccessModal({required this.confettiController});

  @override
  State<_AnimatedSuccessModal> createState() => _AnimatedSuccessModalState();
}

class _AnimatedSuccessModalState extends State<_AnimatedSuccessModal>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      height: 370,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: kBgcolor,
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
              shouldLoop: false,
              blastDirectionality: BlastDirectionality.explosive,
              confettiController: widget.confettiController,
              blastDirection: -3.14 / 2,
              emissionFrequency: 0.15,
              numberOfParticles: 70,
              gravity: 0.6,
              minimumSize: const Size(10, 10),
              maximumSize: const Size(12, 12),
            ),
          ),
          FadeTransition(
            opacity: _opacityAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomDragHandle(),
                  const SizedBox(height: 20),
                  ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        border: Border.all(width: 2, color: kButtonColor),
                        color: kIconButtonColor2,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        '🥳',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text('Account Activated', style: kModalHeader),
                  const SizedBox(height: 10),
                  const Text(
                    'We have confirmed your email address and activated your account. Welcome to Showcase!',
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: kModalContent,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Continue to App',
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
