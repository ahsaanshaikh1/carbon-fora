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

// showTopAlertSuccess({
//   required String text,
//   required BuildContext context,
// }) {
//   showTopSnackBar(
//     Overlay.of(context),
//     CustomSnackBar.success(
//       message: text,
//       backgroundColor: Palette.themecolor,
//     ),
//     displayDuration: const Duration(milliseconds: 700),
//   );
// }
