import 'package:carbon_fora/provider/auth_pro.dart';
import 'package:carbon_fora/route_structure/go_router.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/utils/constants.dart';
import 'package:carbon_fora/utils/helper/shared_preferences/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

bool isLoggedIn = false;
bool showOnBoard = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefHelper.getInstance();
  isLoggedIn = SharedPrefHelper.getBool("isLoggedIn");
  showOnBoard = SharedPrefHelper.getBool("showOnBoard");
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider<AuthPro>(create: (_) => AuthPro())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _routes = RouteName();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Carbon Fora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Palette.themecolor),
        fontFamily: Constants.appFontFamily,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _routes.myrouter,
      builder: (context, child) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, child!),
        maxWidth: double.infinity,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.resize(800, name: TABLET),
          const ResponsiveBreakpoint.resize(1000, name: TABLET),
          const ResponsiveBreakpoint.autoScale(double.infinity, name: DESKTOP),
        ],
      ),
    );
  }
}
