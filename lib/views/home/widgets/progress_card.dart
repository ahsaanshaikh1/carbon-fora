import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String iconPath;
  // final int streakCount;
  // final int totalDays;
  final int completedDays;

  const ProgressCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.iconPath,
    // required this.streakCount,
    // required this.totalDays,
    required this.completedDays,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themewhitecolor.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: themewhitecolor.withAlpha(100)),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: themewhitecolor.withAlpha(40),
              shape: BoxShape.circle,
            ),
            child: Image.asset(iconPath),
          ),
          15.kW,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.kW,
              Text(
                title,
                style: TextStyle(
                  fontSize: mediumfontsize4,
                  color: themewhitecolor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Log daily actions to keep the fire alive",
                style: TextStyle(
                  fontSize: smallfontsize1,
                  color: themewhitecolor.withAlpha(150),
                ),
              ),
              5.kH,
              Row(
                children: List.generate(5, (index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 6),
                    width: 40,
                    height: 6,
                    decoration: BoxDecoration(
                      color: index < completedDays
                          ? themewhitecolor
                          : themewhitecolor.withAlpha(100),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
