import 'dart:async';
import 'dart:developer';

import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/action_log/action_submitted.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EndAction extends StatefulWidget {
  final int selectedOption;

  const EndAction({super.key, required this.selectedOption});

  @override
  State<EndAction> createState() => _EndActionState();
}

class _EndActionState extends State<EndAction> {
  bool showThreshMsg = false;
  double? maxThreshold;
  final DateTime startTime = DateTime.now();
  late Timer _timer;
  late Duration _elapsed;
  LatLng? startLocation;
  StreamSubscription<Position>? positionStream;
  getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    startLocation = LatLng(position.latitude, position.longitude);
  }

  @override
  void initState() {
    super.initState();
    if (widget.selectedOption == 0) {
      maxThreshold = 25 / 3.6;
    } else if (widget.selectedOption == 2) {
      maxThreshold = 12 / 3.6;
    }
    getCurrentLocation();

    positionStream =
        Geolocator.getPositionStream(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.bestForNavigation,
            // timeLimit: Duration(seconds: 1), // meters
          ),
        ).listen((Position position) {
          print(startLocation?.latitude);
          print(startLocation?.longitude);
          log(position.speed.toString());
          if (maxThreshold != null && position.speed > maxThreshold!) {
            setState(() {
              showThreshMsg = true;
            });
          } else if (maxThreshold != null) {
            setState(() {
              showThreshMsg = false;
            });
          }
        });

    _elapsed = DateTime.now().difference(startTime);
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _elapsed = DateTime.now().difference(startTime);
        });
      }
    });
  }

  @override
  void dispose() {
    // Cancel subscription to avoid memory leaks
    if (mounted) {
      positionStream?.cancel();
    }
    super.dispose();
  }

  String _formatElapsed(Duration elapsed) {
    if (elapsed.inSeconds < 60) {
      return "${elapsed.inSeconds} secs";
    } else if (elapsed.inMinutes < 60) {
      return "${elapsed.inMinutes} mins";
    } else if (elapsed.inHours < 24) {
      return "${elapsed.inHours} hours";
    } else if (elapsed.inDays < 30) {
      return "${elapsed.inDays} days";
    } else {
      final months = (elapsed.inDays / 30).floor();
      return "$months months";
    }
  }

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
                Go.route(context, ActionSubmitted());
              },
              height: 60,
              buttoncolor: themewhitecolor,
              borderRadius: BorderRadius.circular(16),
              child: Text(
                "End Trip",
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
                "Make sure to stop the action once you're done to accurately calculate your carbon savings.",
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
                        "End Action",
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
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(.15),
                  border: Border.all(
                    color: Colors.white.withOpacity(.25),
                    width: 1,
                  ),
                ),
                height: 263,
                width: 263,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/png/stopwatch.png",
                            height: 26,
                            fit: BoxFit.cover,
                            width: 26,
                          ),
                          5.kW,
                          Text(
                            "Timer",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      5.kH,
                      Text(
                        _formatElapsed(_elapsed),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Image.asset("assets/images/png/timer.png"),
              60.kH,
              Text(
                "GPS Tracking",
                style: TextStyle(fontSize: 14, color: themewhitecolor),
              ),
              Text(
                "Active",
                style: TextStyle(
                  fontSize: 40,
                  color: themewhitecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              !showThreshMsg ? 0.kH : 30.kH,
              !showThreshMsg
                  ? 0.kH
                  : SizedBox(
                      width: double.infinity,
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Center(
                          child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText(
                                'You are exceding the maximum speed threshold !',
                                textStyle: TextStyle(color: Colors.redAccent),
                              ),
                            ],
                            onTap: () {
                              print("Tap Event");
                            },
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
