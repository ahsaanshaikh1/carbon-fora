import 'dart:async';
import 'package:carbon_fora/main.dart';
import 'package:carbon_fora/provider/auth/auth_pro.dart';
import 'package:carbon_fora/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/route_structure/go_router.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    load();
  }

  load() async {
    Future.delayed(const Duration(seconds: 3), () async {
      if (showOnBoard == false) {
        Go.namedReplace(context, RouteName.onboardingScreen);
      } else if (isLoggedIn) {
        await Provider.of<AuthPro>(context, listen: false).getProfile();
        Go.named(context, RouteName.navbar, params: {'currentIndex': "0"});
      } else {
        Go.named(context, RouteName.welcomeScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.themecolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset(Constants.splashLogo, width: 350)],
            ),
          ),
        ),
      ),
    );
  }
}
