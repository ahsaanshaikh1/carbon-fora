import 'package:carbon_fora/views/auth/forgot_otp/forgot_otp.dart';
import 'package:carbon_fora/views/auth/forgot_password/forgot_password.dart';
import 'package:carbon_fora/views/auth/forgot_password/new_password.dart';
import 'package:carbon_fora/views/auth/login_screen.dart';
import 'package:carbon_fora/views/auth/otp_code/otp_screen.dart';
import 'package:carbon_fora/views/auth/signup_screen.dart';
import 'package:carbon_fora/views/nav_bar/bottom_nav_bar.dart';
import 'package:carbon_fora/views/onboarding/onboardingscreen.dart';
import 'package:carbon_fora/views/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carbon_fora/views/splash/splash_screen.dart';
import 'package:carbon_fora/widgets/error_screen.dart';

class RouteName {
  static const String splashScreen = 'splash';
  static const String onboardingScreen = 'onboarding';
  static const String welcomeScreen = 'welcome';
  static const String loginScreen = 'login';
  static const String signupScreen = 'signup';
  static const String otpScreen = 'otp-screen';
  static const String forgotPasswordScreen = 'forgot-password';
  static const String forgotOtpScreen = 'forgot-otp';
  static const String resetPasswordScreen = 'reset-password';
  static const String navbar = 'nav-bar';
  static const String homeScreen = 'home';

  GoRouter myrouter = GoRouter(
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: ErrorScreen());
    },
    routes: [
      GoRoute(
        path: '/',
        name: splashScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        path: '/$onboardingScreen',
        name: onboardingScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: OnboardingScreen());
        },
      ),
      GoRoute(
        path: '/$welcomeScreen',
        name: welcomeScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: WelcomeScreen());
        },
      ),
      GoRoute(
        path: '/$loginScreen',
        name: loginScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        path: '/$signupScreen',
        name: signupScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignupScreen());
        },
      ),
      GoRoute(
        path: '/$forgotPasswordScreen',
        name: forgotPasswordScreen,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ForgotPasswordScreen());
        },
      ),
      GoRoute(
        path: '/$otpScreen/:otp/:isFromLogin/:isFromForgot/:email',
        name: otpScreen,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: OtpScreen(
              otp: state.pathParameters['otp']!,
              isFormLogin: state.pathParameters['isFromLogin']!,
              isFormForgot: state.pathParameters['isFromForgot']!,
              email: state.pathParameters['email']!,
            ),
          );
        },
      ),
      GoRoute(
        path: '/$forgotOtpScreen/:otp/:email',
        name: forgotOtpScreen,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: ForgotOtpScreen(
              otp: state.pathParameters['otp']!,
              email: state.pathParameters['email']!,
            ),
          );
        },
      ),
      // GoRoute(
      //   path: '/$homeScreen',
      //   name: homeScreen,
      //   pageBuilder: (context, state) {
      //     return const MaterialPage(
      //       child: HomeScreen(),
      //     );
      //   },
      // ),
      // GoRoute(
      //   path: '/$otpScreen/:otp/:isFromLogin/:isFromForgot/:email',
      //   name: otpScreen,
      //   pageBuilder: (context, state) {
      //     return MaterialPage(
      //       child: UserEnterOtpScreen(
      //         otp: state.pathParameters['otp']!,
      //         isFormLogin: state.pathParameters['isFromLogin']!,
      //         isFormForgot: state.pathParameters['isFromForgot']!,
      //         email: state.pathParameters['email']!,
      //       ),
      //     );
      //   },
      // ),
      GoRoute(
        path: '/$resetPasswordScreen/:forgot',
        name: resetPasswordScreen,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: NewPasswordScreen(forgot: state.pathParameters['forgot']!),
          );
        },
      ),
      GoRoute(
        path: '/$navbar/:currentIndex',
        name: navbar,
        pageBuilder: (context, state) {
          return MaterialPage(
            child: BottomNavBar(
              currentIndex: state.pathParameters['currentIndex'] ?? '',
            ),
          );
        },
      ),
    ],
  );
}
