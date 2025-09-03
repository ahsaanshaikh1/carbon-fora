import 'dart:async';
import 'package:carbon_fora/provider/auth/auth_pro.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String otp;
  final String isFormLogin;
  final String isFormForgot;
  final String email;
  const OtpScreen({
    super.key,
    required this.otp,
    required this.isFormLogin,
    required this.isFormForgot,
    required this.email,
  });

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  var code = "";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: size.width / 100 * 18,
      height: 70,
      textStyle: const TextStyle(
        fontSize: largefontsize5,
        color: Palette.themecolor,
        fontWeight: boldfontweightvar2,
      ),
      decoration: BoxDecoration(
        color: themelightgreycolor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: themegreycolor),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Palette.themecolor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Palette.themecolor.withOpacity(0.8),
      ),
      textStyle: const TextStyle(
        fontSize: largefontsize5,
        color: themewhitecolor,
        fontWeight: FontWeight.w600,
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          FilledBox(
            height: 300,
            width: double.infinity,
            gradient: LinearGradient(
              colors: [Palette.primaryColor, Palette.secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.zero,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: -30,
                  top: -20,
                  child: FilledBox(
                    height: 200,
                    width: 200,
                    color: themegreycolor.withAlpha(10),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  left: -30,
                  top: -20,
                  child: FilledBox(
                    height: 300,
                    width: 300,
                    color: themegreycolor.withAlpha(10),
                    shape: BoxShape.circle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.kH,
                      FilledBox(
                        onTap: () {
                          Go.pop(context);
                        },
                        height: 55,
                        width: 55,
                        borderRadius: BorderRadius.circular(20),
                        padding: EdgeInsets.zero,
                        color: themewhitecolor.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Center(
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: themegreycolor,
                            ),
                          ),
                        ),
                      ),
                      40.kH,
                      Center(
                        child: const Text(
                          "Enter Verification code",
                          style: TextStyle(
                            color: themewhitecolor,
                            fontSize: largefontsize4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      7.kH,
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: const Text(
                            "Enter your registered email below to receive password reset instruction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: themewhitecolor,
                              fontSize: mediumfontsize5,
                              fontWeight: boldfontweightvar1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: FilledBox(
              height: double.infinity,
              width: double.infinity,
              color: themewhitecolor,
              padding: EdgeInsets.zero,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      15.kH,
                      Center(
                        child: SvgPicture.asset(
                          "assets/images/svg/otp-code.svg",
                        ),
                      ),
                      30.kH,
                      Center(
                        child: Pinput(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          length: 6,
                          defaultPinTheme: defaultPinTheme,
                          focusedPinTheme: focusedPinTheme,
                          submittedPinTheme: submittedPinTheme,
                          onChanged: (value) {
                            code = value;
                          },
                          showCursor: true,
                          // ignore: avoid_print
                          onCompleted: (pin) => print(pin),
                        ),
                      ),
                      30.kH,
                      const ResendOtpWidgetUser(),
                      60.kH,
                      CustomButton(
                        onTap: () {
                          if (code.length < 6) {
                            showSnackBar(context, "Please enter complete OTP");
                            return;
                          }

                          String enteredOtp = code;
                          String storedOtp = Provider.of<AuthPro>(
                            context,
                            listen: false,
                          ).otpCodeValue.toString();

                          print("Entered OTP: $enteredOtp");
                          print("Stored OTP: $storedOtp");

                          if (storedOtp != enteredOtp) {
                            showSnackBar(context, "Invalid OTP");
                            return;
                          }

                          Provider.of<AuthPro>(
                            context,
                            listen: false,
                          ).verify(context: context, email: widget.email);
                        },
                        buttongradientColor: LinearGradient(
                          colors: [
                            Palette.primaryColor,
                            Palette.secondaryColor,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        height: 60,
                        borderRadius: BorderRadius.circular(12),
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                            color: themewhitecolor,
                            fontSize: mediumfontsize1,
                            fontWeight: boldfontweight,
                          ),
                        ),
                      ),
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
}

class ResendOtpWidgetUser extends StatefulWidget {
  const ResendOtpWidgetUser({super.key});

  @override
  State<ResendOtpWidgetUser> createState() => _ResendOtpWidgetUserState();
}

class _ResendOtpWidgetUserState extends State<ResendOtpWidgetUser> {
  @override
  void initState() {
    runTimer();
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  bool button = false;
  int value = 59;
  Timer? timer;
  void runTimer() {
    setState(() {
      button = false;
      value = 59;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        value -= 1;
      });
      if (value == 1) {
        setState(() {
          button = true;
        });
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text.rich(
            TextSpan(
              text: "Didn’t receive the code? ",
              style: const TextStyle(
                fontSize: mediumfontsize2,
                fontWeight: normalfontweightvar4,
              ),
              children: [
                TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      if (button) {
                        runTimer();
                        Provider.of<AuthPro>(
                          context,
                          listen: false,
                        ).resendOtp(context: context);
                      }
                    },
                  text: "Resend",
                  style: TextStyle(
                    color: button ? Palette.themecolor : themegreytextcolor,
                    fontSize: mediumfontsize1,
                    fontWeight: boldfontweight,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        button == false
            ? Text("00: ${value.toString().padLeft(2, '0')}")
            : Container(),
      ],
    );
  }
}
