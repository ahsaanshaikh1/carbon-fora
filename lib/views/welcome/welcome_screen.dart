import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/route_structure/go_router.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 160,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomButton(
              height: 55,
              borderRadius: BorderRadius.circular(12),
              buttongradientColor: LinearGradient(
                colors: [Palette.primaryColor, Palette.secondaryColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              onTap: () {
                Go.named(context, RouteName.signupScreen);
              },
              child: Text(
                "Registration",
                style: TextStyle(
                  fontSize: mediumfontsize1,
                  color: themewhitecolor,
                ),
              ),
            ),
            15.kH,
            CustomButton(
              height: 55,
              borderRadius: BorderRadius.circular(12),
              buttoncolor: themewhitecolor,
              border: Border.all(color: themegreytextcolor),
              onTap: () {
                Go.named(context, RouteName.loginScreen);
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: mediumfontsize1,
                  color: themeblackcolor,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/svg/welcome.svg",
              height: 300,
              width: double.infinity,
            ),
            30.kH,
            Text(
              "Get Started with CarbonFora",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: largefontsize3,
                color: themeblackcolor,
                fontWeight: boldfontweight,
              ),
            ),
            20.kH,
            Text(
              "Join the movement Track eco-actions, earn carbon credits, and unlock real rewards for making climate-positive choices daily.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: mediumfontsize4),
            ),
          ],
        ),
      ),
    );
  }
}
