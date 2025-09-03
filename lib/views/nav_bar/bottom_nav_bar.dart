import 'package:carbon_fora/provider/action_log/action_log_pro.dart';
import 'package:carbon_fora/provider/auth/auth_pro.dart';
import 'package:carbon_fora/provider/common/common_pro.dart';
import 'package:carbon_fora/provider/voucher/voucher_pro.dart';
import 'package:carbon_fora/services/notification%20services/notification_services.dart';
import 'package:carbon_fora/views/home/home_screen.dart';
import 'package:carbon_fora/views/profile/profile.dart';
import 'package:carbon_fora/views/profile/profile_tab/leaderboard_screen.dart';
import 'package:carbon_fora/views/profile/profile_tab/wallet/wallet.dart';
import 'package:carbon_fora/views/redeem/impact_exchange.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

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
    NotificationServices notificationServices = NotificationServices();
    WidgetsBinding.instance.addPostFrameCallback((v) async {
      Provider.of<AuthPro>(context, listen: false).getHome();
      Provider.of<CommonPro>(context, listen: false).getCategories();
      Provider.of<VoucherPro>(context, listen: false).getHistory();
      Provider.of<AuthPro>(
        context,
        listen: false,
      ).fcmToken(fcmToken: await notificationServices.getDeviceToken());
    });
    select = int.parse(widget.currentIndex);
    pageController = PageController(initialPage: select);
    notificationServices.requestNotificationPermission();
    notificationServices.forgroundMessage();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
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
              bottom: 15,
              left: 20,
              right: 20,
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
                      themewhitecolor.withAlpha(50),
                      themewhitecolor.withAlpha(50),
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
                                  radius: 30,
                                  backgroundColor: themewhitecolor,
                                  child: Image.asset(
                                    height: 45,
                                    "assets/images/png/nav-icon-3.png",
                                  ),
                                )
                              : SizedBox(
                                  width: 65,
                                  height: 65,
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
                                        height: 25,
                                        fit: BoxFit.cover,
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
