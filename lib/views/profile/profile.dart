import 'package:carbon_fora/provider/auth/auth_pro.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/carbon_academy_modules.dart';
import 'package:carbon_fora/views/profile/profile_tab/badges_gamification.dart';
import 'package:carbon_fora/views/profile/profile_tab/carbon_academy.dart';
import 'package:carbon_fora/views/profile/profile_tab/change_password_screen.dart';
import 'package:carbon_fora/views/profile/profile_tab/edit_profile.dart';
import 'package:carbon_fora/views/profile/profile_tab/help_support.dart';
import 'package:carbon_fora/views/profile/profile_tab/notification.dart';
import 'package:carbon_fora/views/profile/profile_tab/privacy_policy.dart';
import 'package:carbon_fora/views/profile/profile_tab/settings.dart';
import 'package:carbon_fora/views/profile/profile_tab/terms_condition.dart';
import 'package:carbon_fora/views/profile/profile_tab/wallet/wallet.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/custom_icon_button.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<MenuItem> menuItems = [
    MenuItem(
      'Edit Profile',
      "assets/images/png/edit-profile.png",
      EditProfile(),
    ),
    MenuItem(
      'Wallet',
      "assets/images/png/wallet.png",
      MyWalletScreen(isBackButtonVisible: true),
    ),
    MenuItem(
      'Change Password',
      "assets/images/png/change-pass.png",
      ChangePasswordScreen(),
    ),
    MenuItem(
      'Carbon Academy',
      "assets/images/png/carbon-academy.png",
      CarbonAcademyModules(),
    ),
    MenuItem(
      'Badges & Gamification',
      "assets/images/png/badge.png",
      BadgesScreen(),
    ),
    MenuItem('Settings', "assets/images/png/setting.png", SettingScreen()),
    // MenuItem(
    //   'Notification',
    //   "assets/images/png/notifications.png",
    //   NotificationScreen(),
    // ),
    MenuItem(
      'Privacy Policy',
      "assets/images/png/privacy-policy.png",
      PrivacyPolicy(),
    ),
    MenuItem(
      'Terms & Condition',
      "assets/images/png/terms-condition.png",
      TermsCondition(),
    ),
    MenuItem(
      'Help / Support',
      "assets/images/png/help-support.png",
      HelpSupport(),
    ),
  ];
  String formatNumber(double number) {
    if (number >= 1000000000) {
      return (number / 1000000000)
              .toStringAsFixed(2)
              .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "") +
          "B";
    } else if (number >= 1000000) {
      return (number / 1000000)
              .toStringAsFixed(2)
              .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "") +
          "M";
    } else if (number >= 1000) {
      return (number / 1000)
              .toStringAsFixed(2)
              .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "") +
          "k";
    } else {
      return number
          .toStringAsFixed(4)
          .replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8AA2), Color(0xFF4834AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              _buildBackAndProfileSection(context, size),
              20.kH,
              Consumer<AuthPro>(
                builder: (context, pro, child) {
                  return Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.5,
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            padding: EdgeInsets.all(3),
                            child: CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.white,
                              backgroundImage: NetworkImage(
                                UrlHelper.resolve(
                                  pro.profile?.profile ??
                                      'https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png',
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   child: InkWell(
                          //     onTap: () {},
                          //     child: CircleAvatar(
                          //       radius: 12,
                          //       backgroundColor: Colors.white,
                          //       child: Icon(
                          //         Icons.edit,
                          //         size: 14,
                          //         color: Colors.black,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '${pro.profile?.firstName ?? ''} ${pro.profile?.lastName ?? ''}'
                                .trim()
                                .isNotEmpty
                            ? '${pro.profile?.firstName ?? ''} ${pro.profile?.lastName ?? ''}'
                                  .trim()
                            : 'Huzaifa Arain',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Consumer<AuthPro>(
                        builder: (context, pro, child) {
                          return Text(
                            '${Provider.of<AuthPro>(context, listen: false).model != null ? formatNumber(Provider.of<AuthPro>(context, listen: false).model!.totalCo2Saved * 1000) + " kg\nCO2e" : "0" + " kg\nCO2e"} Saved',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white70),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: ListView.builder(
                      itemCount: menuItems.length,
                      itemBuilder: (context, index) {
                        return _buildMenuItem(menuItems[index], context);
                      },
                    ),
                  ),
                ),
              ),
              100.kH,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackAndProfileSection(BuildContext context, size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: InkWell(
                //     onTap: () {
                //       Navigator.pop(context);
                //     },
                //     child: Container(
                //       padding: const EdgeInsets.only(
                //         left: 14,
                //         top: 8,
                //         bottom: 8,
                //         right: 7,
                //       ),
                //       decoration: BoxDecoration(
                //         border: Border.all(width: 2, color: Color(0xfe1D8AA2)),
                //         color: Color(0xfe1D8AA2),
                //         borderRadius: BorderRadius.circular(6),
                //       ),
                //       child: const Icon(
                //         Icons.arrow_back_ios,
                //         color: Color.fromARGB(252, 149, 215, 231),
                //       ),
                //     ),
                //   ),
                // ),
                const Center(
                  child: Text(
                    "My Profile",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomIconButton(
                    onTap: () {
                      logout(size);
                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.logout_outlined, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(MenuItem item, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {
          if (item.title == "Badges & Gamification") {
            showTopAlertInfo(
              context: context,
              text: "This will be available in future update.",
            );
          } else if (item.title == "Change Password" &&
              !Provider.of<AuthPro>(
                context,
                listen: false,
              ).profile!.provider.contains("EMAIL")) {
                //info@carbonfora.com
            showTopAlertInfo(
              context: context,
              text: "You are logged in using social account",
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item.destination),
            );
          }
        },
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.white,
          child: Image.asset(item.icon, height: 22),
        ),
        title: Text(
          item.title,
          style: const TextStyle(color: Colors.white, fontSize: 18),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
          size: 16,
        ),
      ),
    );
  }

  Future<Object?> logout(Size size) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          scrollable: true,
          surfaceTintColor: themewhitecolor,
          backgroundColor: themewhitecolor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          titlePadding: const EdgeInsets.all(24),
          actionsPadding: const EdgeInsets.all(0),
          buttonPadding: const EdgeInsets.all(0),
          title: Form(
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Log Out From Status",
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeblackcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  6.kH,
                  const Center(
                    child: Text(
                      "Exit your current status to disconnect, refresh, and stay secure.",
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeblackcolor,
                        fontSize: mediumfontsize3,
                      ),
                    ),
                  ),
                  20.kH,
                  Row(
                    children: [
                      Expanded(
                        child: FilledBox(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          height: 55,
                          color: themewhitecolor,
                          padding: EdgeInsets.zero,
                          boxShadow: const [
                            BoxShadow(color: themegreycolor, blurRadius: 10),
                          ],
                          child: const Center(
                            child: Text(
                              "Cancel",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: mediumfontsize4,
                                fontWeight: boldfontweight,
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.kW,
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            Provider.of<AuthPro>(
                              context,
                              listen: false,
                            ).logout(context);
                          },
                          height: 55,
                          borderRadius: BorderRadius.circular(12),
                          child: const Text(
                            "Yes, Logout",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: themewhitecolor,
                              fontSize: mediumfontsize4,
                              fontWeight: boldfontweight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  final String title;
  final String icon;
  final Widget destination;

  MenuItem(this.title, this.icon, this.destination);
}
