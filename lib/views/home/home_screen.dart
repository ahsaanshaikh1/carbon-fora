import 'package:carbon_fora/provider/auth_pro.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/action_log/action_log.dart';
import 'package:carbon_fora/views/home/widgets/progress_card.dart';
import 'package:carbon_fora/views/home/widgets/redeem_card.dart';
import 'package:carbon_fora/views/profile/profile_tab/edit_profile.dart';
import 'package:carbon_fora/views/profile/profile_tab/leaderboard_screen.dart';
import 'package:carbon_fora/views/profile/profile_tab/notification.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:super_tooltip/super_tooltip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Palette.secondaryColor, Palette.primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                15.kH,
                Consumer<AuthPro>(
                  builder: (context, pro, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: themewhitecolor,
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 26,
                              backgroundImage: NetworkImage(
                                UrlHelper.resolve(
                                  pro.profile?.profile ??
                                      'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png',
                                ),
                              ),
                            ),
                          ),
                          16.kW,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${pro.profile?.firstName ?? ''} ${pro.profile?.lastName ?? ''}'
                                          .trim()
                                          .isNotEmpty
                                      ? '${pro.profile?.firstName ?? ''} ${pro.profile?.lastName ?? ''}'
                                            .trim()
                                      : 'Huzaifa Arain',
                                  style: Theme.of(context).textTheme.titleMedium
                                      ?.copyWith(
                                        color: themewhitecolor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  "You've saved 45.2 kg CO₂e",
                                  style: Theme.of(context).textTheme.bodySmall
                                      ?.copyWith(color: themegreycolor),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Go.route(
                                context,
                                LeaderboardScreen(isBackButtonVisible: true),
                              );
                            },
                            child: Image.asset(
                              "assets/images/png/leaderboard.png",
                              width: 32,
                              height: 32,
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              Go.route(context, NotificationScreen());
                            },
                            child: Container(
                              height: 35,
                              width: 35,
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color: themewhitecolor,
                                ),
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.notifications_outlined,
                                  color: themewhitecolor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                20.kH,
                GridView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 120,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return FilledBox(
                      padding: EdgeInsets.all(12),
                      color: themewhitecolor.withAlpha(20),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: themewhitecolor.withAlpha(100)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                index == 0
                                    ? "assets/images/png/plant.png"
                                    : "assets/images/png/co2.png",
                                width: 50,
                              ),
                              Text(
                                index == 0 ? "12.6 kg" : "3.1 kg\nCO2e",
                                style: TextStyle(
                                  fontSize: smallfontsize1,
                                  color: themewhitecolor,
                                  fontWeight: boldfontweight,
                                ),
                              ),
                            ],
                          ),
                          25.kH,
                          Row(
                            children: [
                              Text(
                                index == 0
                                    ? "Carbon Credit"
                                    : "Total CO₂ Saved",
                                style: TextStyle(
                                  fontSize: mediumfontsize5,
                                  color: themewhitecolor,
                                  fontWeight: boldfontweight,
                                ),
                              ),
                              15.kW,
                              index == 0
                                  ? SuperTooltip(
                                      showBarrier: true,
                                      showDropBoxFilter: true,
                                      sigmaX: 10,
                                      sigmaY: 10,
                                      content: FilledBox(
                                        height: 150,
                                        width: size.width / 100 * 80,
                                        padding: EdgeInsets.all(8),
                                        borderRadius: BorderRadius.circular(10),
                                        color: themewhitecolor,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                const Text(
                                                  "Carbon Credits",
                                                  softWrap: true,
                                                  style: TextStyle(
                                                    color: themeblackcolor,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  "assets/images/svg/carbon-credit.svg",
                                                  width: 40,
                                                ),
                                              ],
                                            ),
                                            10.kH,
                                            Text(
                                              "Credits earned are calculated based on verified micro-actions and validated using timestamps, GPS, and image proof. Final acceptance depends on verification protocols.",
                                              style: TextStyle(
                                                fontSize: smallfontsize1,
                                                color: themegreytextcolor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                20.kH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: FilledBox(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    color: themewhitecolor.withAlpha(20),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: themewhitecolor.withAlpha(100)),
                    child: Row(
                      children: [
                        Image.asset("assets/images/png/dollar.png"),
                        10.kW,
                        Text(
                          "Dollar Value earned",
                          style: TextStyle(
                            fontSize: mediumfontsize2,
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
                          content: FilledBox(
                            height: 150,
                            width: size.width / 100 * 70,
                            padding: EdgeInsets.all(10),
                            borderRadius: BorderRadius.circular(10),
                            color: themewhitecolor,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Earned Dollar",
                                      softWrap: true,
                                      style: TextStyle(color: themeblackcolor),
                                    ),
                                    ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                          colors: [
                                            Color(0xFF4834AA),
                                            Color(0xFF1D8AA2),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ).createShader(bounds);
                                      },
                                      blendMode: BlendMode.srcIn,
                                      child: Image.asset(
                                        "assets/images/png/dollar.png",
                                        width: 35,
                                        height: 35,
                                      ),
                                    ),
                                  ],
                                ),
                                10.kH,
                                Text(
                                  "Estimated value based on average carbon credit prices in the voluntary market. Actual redemption value may vary based on partner offers and market rates.",
                                  style: TextStyle(
                                    fontSize: smallfontsize1,
                                    color: themegreytextcolor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          child: Icon(Icons.info_outline, color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          ('\$147'),
                          style: TextStyle(
                            fontSize: mediumfontsize1,
                            color: themewhitecolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                12.kH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Streaks Achievement",
                    style: TextStyle(
                      fontSize: mediumfontsize1,
                      color: themewhitecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                10.kH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: ProgressCard(
                    title: "You're on a 6-day Streak",
                    subTitle: "Log daily actions to keep the fire alive",
                    iconPath: "assets/images/png/fire.png",
                    completedDays: 3,
                  ),
                ),
                12.kH,
                InkWell(
                  onTap: () async {
                    bool serviceEnabled =
                        await Geolocator.isLocationServiceEnabled();
                    if (!serviceEnabled) {
                      await Geolocator.openLocationSettings();
                    }

                    await Geolocator.requestPermission();
                    if (!await Geolocator.isLocationServiceEnabled()) {
                      showSnackBar(context, "Please enable location service.");
                    } else if (!await Permission.location.isGranted) {
                      showSnackBar(
                        context,
                        "Please provide location permission.",
                      );
                    } else {
                      Go.route(context, LogActionScreen());
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: ProgressCard(
                      title: "3 Actions Logged This Week",
                      subTitle: "e.g., goal = 5 actions/week",
                      iconPath: "assets/images/png/award.png",
                      completedDays: 3,
                    ),
                  ),
                ),
                12.kH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    height: 70,
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: themewhitecolor.withAlpha(20),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: themewhitecolor.withAlpha(100)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: themewhitecolor.withAlpha(50),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset("assets/images/png/shield.png"),
                        ),
                        15.kW,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "First Ride",
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: themewhitecolor,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            5.kH,
                            Image.asset("assets/images/png/earned.png"),
                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                            color: themewhitecolor.withAlpha(40),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Center(
                            child: Text(
                              "Level 1",
                              style: TextStyle(
                                fontSize: smallfontsize2,
                                color: themewhitecolor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                15.kH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Redeem Teaser",
                    style: TextStyle(
                      fontSize: mediumfontsize1,
                      color: themewhitecolor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                10.kH,
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: List.generate(redeemData.length, (index) {
                        final item = redeemData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: RedeemCard(
                            title: item["title"]!,
                            subtitle: item["subtitle"]!,
                            iconPath: item["icon"]!,
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
