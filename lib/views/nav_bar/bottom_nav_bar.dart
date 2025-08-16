import 'package:carbon_fora/views/home/home_screen.dart';
import 'package:carbon_fora/views/profile/profile.dart';
import 'package:carbon_fora/views/profile/profile_tab/leaderboard_screen.dart';
import 'package:carbon_fora/views/profile/profile_tab/wallet/wallet.dart';
import 'package:carbon_fora/views/redeem/impact_exchange.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/widgets/custom_icon_button.dart';
import 'package:flutter_svg/svg.dart';

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
                MyWalletScreen(isBackButtonVisible: false),
                ImpactExchange(isBackButtonVisible: false),
                LeaderboardScreen(isBackButtonVisible: false),
                ProfileScreen(),
              ],
            ),
            Positioned(
              bottom: 20, // bottom se upar shift
              left: 20,
              right: 20,
              // padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Container(
                height: 80,
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
                                  child: SvgPicture.asset(
                                    "assets/images/svg/nav-icon-3.svg",
                                  ),
                                )
                              : SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        index == 0
                                            ? "assets/images/svg/nav-icon-1.svg"
                                            : index == 1
                                            ? "assets/images/svg/nav-icon-2.svg"
                                            : index == 3
                                            ? "assets/images/svg/nav-icon-4.svg"
                                            : "assets/images/svg/nav-icon-5.svg",
                                        height: 30,
                                        color: themewhitecolor,
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
