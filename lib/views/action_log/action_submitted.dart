import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/action_log/log_history.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/material.dart';

class ActionSubmitted extends StatefulWidget {
  const ActionSubmitted({super.key});

  @override
  State<ActionSubmitted> createState() => _ActionSubmittedState();
}

class _ActionSubmittedState extends State<ActionSubmitted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 180,
        color: Palette.primaryColor,
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            CustomButton(
              onTap: () {
                Go.route(context, LogHistory());
              },
              height: 60,
              buttoncolor: themewhitecolor,
              borderRadius: BorderRadius.circular(16),
              child: Text(
                "View Log History",
                style: TextStyle(
                  fontSize: mediumfontsize2,
                  color: Palette.primaryColor,
                  fontWeight: boldfontweight,
                ),
              ),
            ),
            30.kH,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "CarbonFora ensures all actions are verified using AI and community standards. Learn how verification works ",
                style: TextStyle(fontSize: 14, color: themewhitecolor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8AA2), Color(0xFF4834AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        FilledBox(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(12),

                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Color.fromARGB(252, 149, 215, 231),
                          ),
                        ),
                      ],
                    ),
                    const Center(
                      child: Text(
                        "Action Submitted",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              60.kH,
              Image.asset("assets/images/png/check.png"),
              30.kH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "Your action has been logged successfully.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    color: themewhitecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              20.kH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(
                  "We're now verifying your activity and the proof you've submitted. This process takes approx 1 hour depending on volume. Once verified, your carbon credits and earnings will appear in your Wallet.",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
