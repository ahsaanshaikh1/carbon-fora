import 'package:carbon_fora/provider/auth_pro.dart';
import 'package:carbon_fora/theme/spacing.dart';
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
import 'package:carbon_fora/widgets/custom_icon_button.dart';
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
    MenuItem('Edit Profile', Icons.edit, EditProfile()),
    MenuItem(
      'Wallet',
      Icons.account_balance_wallet,
      MyWalletScreen(isBackButtonVisible: true),
    ),
    MenuItem(
      'Change Password',
      Icons.account_balance_wallet,
      ChangePasswordScreen(),
    ),
    MenuItem('Carbon Academy', Icons.school, CarbonAcademy()),
    MenuItem('Badges & Gamification', Icons.emoji_events, BadgesScreen()),
    MenuItem('Settings', Icons.settings, SettingScreen()),
    MenuItem('Notification', Icons.notifications, NotificationScreen()),
    MenuItem('Privacy Policy', Icons.privacy_tip, PrivacyPolicy()),
    MenuItem('Terms & Condition', Icons.description, TermsCondition()),
    MenuItem('Help / Support', Icons.headset_mic, HelpSupport()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
              _buildBackAndProfileSection(context),
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
                          Positioned(
                            child: InkWell(
                              onTap: () {},
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.edit,
                                  size: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
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
                      const Text(
                        '45.2 kg CO₂e Saved',
                        style: TextStyle(color: Colors.white70, fontSize: 14),
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
              60.kH,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackAndProfileSection(BuildContext context) {
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
                      Provider.of<AuthPro>(
                        context,
                        listen: false,
                      ).logout(context);
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
          if (item.title == "Change Password" &&
              !Provider.of<AuthPro>(
                context,
                listen: false,
              ).profile!.provider.contains("EMAIL")) {
            showSnackBar(context, "You are logged in using social account");
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => item.destination),
            );
          }
        },
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(item.icon, color: Color(0xFF0A94D2), size: 30),
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
}

class MenuItem {
  final String title;
  final IconData icon;
  final Widget destination;

  MenuItem(this.title, this.icon, this.destination);
}
