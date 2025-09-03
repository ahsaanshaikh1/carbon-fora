import 'package:carbon_fora/main.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/route_structure/go_router.dart';
import 'package:carbon_fora/utils/helper/shared_preferences/preference_helper.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;
  final GlobalKey<SlideActionState> _sliderKey = GlobalKey();
  bool showSliderButton = true;
  storeOnBoarding() async {
    // String isViewed = widget.isViewed;
    // SharedPreferences preferences = await SharedPreferences.getInstance();
    // await preferences.setString('onboarding', isViewed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              onPageChanged: (int page) {
                setState(() {
                  currentIndex = page;
                });
              },
              controller: _pageController,
              children: const [
                CreatePage(
                  image: 'assets/images/png/onboarding-1.png',
                  title: "Turn habits into climate action",
                  subtitle: "Track eco-friendly steps. Earn real rewards.",
                ),
                CreatePage(
                  image: 'assets/images/png/onboarding-2.png',
                  title: "Your actions count",
                  subtitle:
                      "Recycle, ride, or save power — get verified credits.",
                ),
                CreatePage(
                  image: 'assets/images/png/onboarding-3.png',
                  title: "Rewards that fit your lifestyle",
                  subtitle:
                      "Travel, fashion, personal care — all within reach.",
                ),
                CreatePage(
                  image: 'assets/images/png/onboarding-4.png',
                  title: "Smart, verified, climate-positive",
                  subtitle: "AI-driven. Blockchain-backed. Easy to use.",
                ),
              ],
            ),
            Positioned(
              top: 20,
              left: 16,
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: themewhitecolor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (currentIndex == 3) {
                          _pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );
                        } else if (currentIndex == 2) {
                          _pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );
                        } else if (currentIndex == 1) {
                          _pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 800),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: Icon(Icons.arrow_back_ios, size: 25),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30,
              right: 0,
              bottom: 135,
              child: Row(children: _buildIndicator()),
            ),
            Positioned(
              bottom: 40,
              left: 20,
              right: 20,
              child: Column(
                children: [
                  SlideAction(
                    key: _sliderKey,
                    onSubmit: () async {
                      await SharedPrefHelper.putBool("showOnBoard", true);
                      setState(() {
                        showOnBoard = true;
                      });
                      Go.named(context, RouteName.welcomeScreen);
                    },
                    height: 70,
                    elevation: 4,
                    borderRadius: 12,
                    sliderButtonIcon: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    innerColor: Palette.themecolor,
                    outerColor: Colors.white,
                    text: 'Swipe to start',
                    textStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // if (showSliderButton)
                  //   Center(
                  //     child: SizedBox(
                  //       width: size.width * 0.9,
                  //       child: SliderButton(
                  //         action: () async {
                  //           if (currentIndex == 0) {
                  //             _pageController.animateToPage(
                  //               1,
                  //               duration: const Duration(milliseconds: 800),
                  //               curve: Curves.easeInOut,
                  //             );
                  //           } else if (currentIndex == 1) {
                  //             _pageController.animateToPage(
                  //               2,
                  //               duration: const Duration(milliseconds: 800),
                  //               curve: Curves.easeInOut,
                  //             );
                  //           } else if (currentIndex == 2) {
                  //             _pageController.animateToPage(
                  //               3,
                  //               duration: const Duration(milliseconds: 800),
                  //               curve: Curves.easeInOut,
                  //             );
                  //           } else if (currentIndex == 3) {
                  //             Go.named(context, RouteName.welcomeScreen);
                  //             // SharedPreferences prefs =
                  //             //     await SharedPreferences.getInstance();
                  //             // await prefs.setBool("showOnBoard", false);
                  //           }
                  //         },
                  //         vibrationFlag: false,

                  //         /// Label text
                  //         label: const Text(
                  //           "Swipe to start",
                  //           style: TextStyle(
                  //             color: Color(0xff4a4a4a),
                  //             fontWeight: FontWeight.w500,
                  //             fontSize: 16,
                  //           ),
                  //         ),

                  //         /// Swipe button icon with gradient background
                  //         icon: Container(
                  //           width: 50,
                  //           height: 50,
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(10),
                  //             gradient: const LinearGradient(
                  //               colors: [Color(0xFF4834AA), Color(0xFF1D8AA2)],
                  //               begin: Alignment.topLeft,
                  //               end: Alignment.bottomRight,
                  //             ),
                  //           ),
                  //           child: const Icon(
                  //             Icons.arrow_forward,
                  //             color: Colors.white,
                  //             size: 24,
                  //           ),
                  //         ),
                  //         width: 400,
                  //         radius: 20,
                  //         buttonSize: 45,
                  //         backgroundColor: Colors.white,
                  //         baseColor: themegreycolor,
                  //         highlightedColor: themegreytextcolor,
                  //       ),
                  //     ),
                  //   ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 20,
            //   child: CustomRoundedButton(
            //       buttonText: "Get Started",
            //       buttoncolor: themeblackcolor,
            //       buttontextcolor: themewhitecolor,
            //       onTap: () {
            //         _storeOnBoarding();
            //         // RouteNavigator.replacementroute(
            //         //   context,
            //         //   const SignupScreen(),
            //         // );
            //       },
            //       height: kMinInteractiveDimension,
            //       width: MediaQuery.of(context).size.width * 0.80),
            // ),
          ],
        ),
      ),
    );
  }

  //Extra Widgets

  //Create the indicator decorations widget
  Widget _activeindicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isActive ? 40 : 8,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Palette.themecolor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _inactiveindicator(bool isInActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10.0,
      width: isInActive ? 30 : 10,
      margin: const EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: themegreycolor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  //Create the indicator list
  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 4; i++) {
      if (currentIndex == i) {
        indicators.add(_activeindicator(true));
      } else {
        indicators.add(_inactiveindicator(false));
      }
    }

    return indicators;
  }
}

class CreatePage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const CreatePage({
    Key? key,
    required this.image,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black87, Colors.transparent],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 200,
              left: 10,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: themewhitecolor,
                        fontSize: largefontsize3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: themegreytextcolor,
                        fontSize: mediumfontsize2,
                        fontWeight: boldfontweightvar1,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
