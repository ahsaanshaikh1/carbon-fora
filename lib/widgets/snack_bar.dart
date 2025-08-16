import 'package:awesome_top_snackbar/awesome_top_snackbar.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, String message) {
  final snackBar = SnackBar(
    backgroundColor: Palette.themecolor,
    duration: const Duration(milliseconds: 1500),
    content: Text(
      message,
      style: const TextStyle(
        color: themewhitecolor,
        fontWeight: boldfontweight,
      ),
    ),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showTopAlertInfo({required String text, required BuildContext context}) {
  awesomeTopSnackbar(
    context,
    text,
    backgroundColor: Palette.themecolor,
    icon: const Icon(Icons.info_outline, color: themewhitecolor),
  );
  // showTopSnackBar(
  //   Overlay.of(context),
  //   CustomSnackBar.info(
  //     backgroundColor: Palette.themecolor,
  //     message: text,
  //   ),
  //   displayDuration: const Duration(milliseconds: 700),
  // );
}

showTopAlertSuccess({required String text, required BuildContext context}) {
  awesomeTopSnackbar(
    context,
    text,
    backgroundColor: Palette.themecolor,
    icon: const Icon(Icons.info_outline, color: themewhitecolor),
  );

  // showTopSnackBar(
  //   Overlay.of(context),
  //   CustomSnackBar.success(
  //     message: text,
  //     backgroundColor: Palette.themecolor,
  //   ),
  //   displayDuration: const Duration(milliseconds: 700),
  // );
}

showTopAlertError({required String text, required BuildContext context}) {
  awesomeTopSnackbar(
    context,
    text,
    backgroundColor: themeredcolor,
    icon: const Icon(Icons.error_outline, color: themewhitecolor),
  );

  // showTopSnackBar(
  //   Overlay.of(context),
  //   CustomSnackBar.error(
  //     message: text,
  //   ),
  //   displayDuration: const Duration(milliseconds: 700),
  // );
}
