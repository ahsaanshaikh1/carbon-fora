import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:flutter/material.dart';

class RedeemCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String iconPath;

  const RedeemCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themewhitecolor.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: themewhitecolor.withAlpha(100)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(iconPath),
              10.kW,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: mediumfontsize3,
                      color: themewhitecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: themewhitecolor.withAlpha(150),
                      fontWeight: FontWeight.bold,
                      fontSize: smallfontsize1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> redeemData = [
  {
    "title": "Redeem",
    "subtitle": "10 Credits",
    "icon": "assets/images/png/gift.png",
  },
  {
    "title": "Skincar Gifts",
    "subtitle": "30 Credits",
    "icon": "assets/images/png/lipstick.png",
  },
  {
    "title": "Bonus",
    "subtitle": "50 Credits",
    "icon": "assets/images/png/bag.png",
  },
];
