import 'dart:ui';

import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String icon;
  final String value;
  final String kg;

  const StatCard({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.kg,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: themewhitecolor.withAlpha(20),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: themewhitecolor.withAlpha(100)),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(icon),
              25.kH,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: themewhitecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  10.kW,
                  SuperTooltip(
                    showBarrier: true,
                    showDropBoxFilter: true,
                    sigmaX: 10,
                    sigmaY: 10,
                    content: const Text(
                      "Lorem ipsum dolor sit amet, consetetur sadipscing elitr",
                      softWrap: true,
                      style: TextStyle(color: Colors.black),
                    ),
                    child: Icon(Icons.info_outline, color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium?.copyWith(color: themewhitecolor),
                  ),
                  Text(
                    kg,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: themewhitecolor,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
