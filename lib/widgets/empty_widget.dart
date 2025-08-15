import 'package:flutter/material.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/utils/constants.dart';

Widget emptyWidget({
  String text = "No Data Found",
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Center(
          child: Image.asset(
        Constants.splashLogo,
        color: themegreycolor,
        width: 100,
      )),
      10.kH,
      Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: themegreycolor,
          fontStyle: FontStyle.italic,
        ),
      )
    ],
  );
}
