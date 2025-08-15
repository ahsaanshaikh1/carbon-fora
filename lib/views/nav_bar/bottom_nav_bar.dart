import 'package:carbon_fora/views/home/home_screen.dart';
import 'package:carbon_fora/views/profile/profile.dart';
import 'package:carbon_fora/views/profile/profile_tab/leaderboard_screen.dart';
import 'package:carbon_fora/views/profile/profile_tab/wallet/wallet.dart';
import 'package:carbon_fora/views/redeem/impact_exchange.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class BottomNavBar extends StatefulWidget {
  String currentIndex;
  BottomNavBar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int select = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    select = int.parse(widget.currentIndex);
    pageController = PageController(initialPage: select);
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      select = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: themelightgreycolor,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   shape: const CircleBorder(),
      //   backgroundColor: Palette.themecolor,
      //   onPressed: () {
      //     Go.route(
      //       context,
      //       const NewItemScreen(),
      //     );
      //   },
      //   child: const Icon(
      //     Icons.add,
      //     color: themewhitecolor,
      //   ),
      // ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          // clipBehavior: Clip.none,
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                HomeScreen(),
                MyWalletScreen(),
                ImpactExchange(),
                LeaderboardScreen(),
                ProfileScreen(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Container(
                height: 75,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: themewhitecolor.withOpacity(.3),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      themewhitecolor.withAlpha(80),
                      themewhitecolor.withAlpha(80),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        5,
                        (index) => CustomIconButton(
                          onTap: () {
                            navigationTapped(index);
                          },
                          child: index == 2
                              ? CircleAvatar(
                                  radius: 28,
                                  backgroundColor: themewhitecolor,
                                  child: Image.asset(
                                    "assets/images/png/nav-icon-3.png",
                                  ),
                                )
                              : SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        index == 0
                                            ? "assets/images/png/nav-icon-1.png"
                                            : index == 1
                                            ? "assets/images/png/nav-icon-2.png"
                                            : index == 3
                                            ? "assets/images/png/nav-icon-4.png"
                                            : "assets/images/png/nav-icon-5.png",
                                        height: 30,
                                        color: select == index
                                            ? Palette.primaryColor
                                            : themewhitecolor,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
