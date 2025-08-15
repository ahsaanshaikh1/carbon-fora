import 'dart:developer';
import 'dart:io';

import 'package:carbon_fora/helper/function_helper.dart';
import 'package:carbon_fora/main.dart';
import 'package:carbon_fora/model/user_m.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/route_structure/go_router.dart';
import 'package:carbon_fora/utils/api.dart';
import 'package:carbon_fora/utils/dailog.dart';
import 'package:carbon_fora/utils/enum.dart';
import 'package:carbon_fora/utils/helper/error_handler.dart';
import 'package:carbon_fora/utils/helper/shared_preferences/preference_helper.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class AuthPro with ChangeNotifier {
  static final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoadingProfile = true;
  UserModel? profile;
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  String otpCodeValue = "";
  String? emailValue;
  void setOtpCode(String otp) {
    otpCodeValue = otp;
    notifyListeners();
  }

  signUp({
    required BuildContext context,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {
    CustomDailog.loadingDailog(context);
    notifyListeners();

    try {
      final response = await postFunction(
        {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "phone": phone,
          "password": password,
        },
        Api.user.signup,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );

      // Loader band karo
      if (context.mounted) Go.pop(context);

      if (response != null) {
        showSnackBar(context, response['message'] ?? 'Something went wrong');

        if (response['success'] == true) {
          emailValue = email;

          String? token = response["token"];
          if (token != null) {
            storeSessionTemp(token: token);
          } else {
            showSnackBar(context, "Token missing from response");
            return;
          }

          setOtpCode(response['otp']?.toString() ?? '');

          if (context.mounted) {
            Go.named(
              context,
              RouteName.otpScreen,
              params: {
                "otp": response['otp']?.toString() ?? '',
                "isFromLogin": "false",
                "isFromForgot": "false",
                "email": email,
              },
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) Go.pop(context);
      showSnackBar(context, "Something went wrong: ${e.toString()}");
      ErrorHandler.catchException(context, e);
    }
  }

  verify({required BuildContext context, required String email}) async {
    try {
      CustomDailog.loadingDailog(context);
      final data = await ApiHandler.getFunction(
        api: Api.user.verify,
        authorization: true,
        tokenKey: SharedPrefHelper.utils.authorizedTokenTemp,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (data != null && data['success'] == true) {
        if (context.mounted) {
          storeSession(token: data['token'], context: context);
          Go.pop(context);
          showSnackBar(context, "Verification Successful!");
          Go.namedReplace(
            context,
            RouteName.navbar,
            params: {'currentIndex': "0"},
          );

          SharedPrefHelper.putBool("isLoggedIn", true);
          isLoggedIn = true;
        } else {
          if (context.mounted) {
            Go.pop(context);
            ErrorHandler.apiException(
              context,
              data['message'] ?? "signUp failed",
            );
          }
        }
      }
    } catch (e) {
      Go.pop(context);
      ErrorHandler.catchException(context, e);
    }
  }

  googleSignIn({required BuildContext context}) async {
    try {
      CustomDailog.loadingDailog(context);
      final GoogleSignInAccount? googleUser = await _googleSignIn
          .authenticate();
      if (googleUser == null) {
        Go.pop(context);
        showSnackBar(context, "Something went wrong");
        return;
      }

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      log(googleAuth.idToken ?? "");
    } catch (e) {
      Go.pop(context);
      showSnackBar(context, "Something went wrong");
    }
  }

  resendOtp({required BuildContext context}) async {
    try {
      CustomDailog.loadingDailog(context);
      final response = await ApiHandler.getFunction(
        authorization: true,
        tokenKey: SharedPrefHelper.utils.authorizedTokenTemp,
        api: Api.user.resend,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (response != null && response['success'] == true) {
        otpCodeValue = response['otp'].toString();
        showSnackBar(context, response['message']);
        // await storeSessionTemp(token: response['token']);

        Go.pop(context);
      } else {
        Go.pop(context);
        ErrorHandler.apiException(
          context,
          response['message'] ?? "resend failed",
        );
        return false;
      }
    } catch (e) {
      Go.pop(context);
      ErrorHandler.catchException(context, e);
      return false;
    }
  }

  login({
    required String email,
    required String pass,
    required BuildContext context,
  }) async {
    CustomDailog.loadingDailog(context); // ✅ Show Loader
    notifyListeners();
    log(email);
    log(pass);
    // try {
    var data = await postFunction(
      {"email": email, "password": pass},
      Api.user.login,
      headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
    );

    if (data != null && data['success'] == true) {
      if (context.mounted) {
        showSnackBar(context, data['message']);
        SharedPrefHelper.remove(SharedPrefHelper.utils.authorizedToken);
        String userId = data['token'];

        if (data['verified'] == true) {
          await storeSession(token: userId, context: context);
          if (context.mounted) {
            Go.pop(context);
            Go.namedReplace(
              context,
              RouteName.navbar,
              params: {"currentIndex": "0"},
            );
            SharedPrefHelper.putBool("isLoggedIn", true);
            isLoggedIn = true;
          }
        } else {
          await storeSessionTemp(
            token: userId,
            // context: context,
          );
          log("User not verified, navigating to OTP screen...");
          setOtpCode(data['otp'].toString());
          Go.pop(context);
          Go.named(
            context,
            RouteName.otpScreen,
            params: {
              "otp": data['otp']?.toString() ?? '',
              "isFromLogin": "true",
              "isFromForgot": "false",
              "email": email,
            },
          );
        }
      }
    } else {
      if (context.mounted) {
        Go.pop(context); // ✅ Close Loader
        ErrorHandler.apiException(context, data['message'] ?? "Login failed");
      }
    }
    // } catch (e) {
    //   if (context.mounted) {
    //     Go.pop(context); // ✅ Close Loader
    //     ErrorHandler.catchException(context, e);
    //   }
    // }
  }

  forgotPassword({required String email, required BuildContext context}) async {
    CustomDailog.loadingDailog(context);
    try {
      final data = await postFunction(
        {"email": email},
        Api.user.forgot,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );

      Go.pop(context);

      if (data != null && data['success'] == true) {
        emailValue = email;
        String token = data["token"];
        storeSessionTemp(token: token);
        setOtpCode(data['otp'].toString());

        showSnackBar(context, data['message'] ?? "OTP sent successfully");

        Go.named(
          context,
          RouteName.forgotOtpScreen,
          params: {'otp': data['otp'].toString(), 'email': email},
        );
      } else {
        showSnackBar(
          context,
          data?['message'] ?? "Invalid email or request failed",
        );
      }
    } catch (e) {
      Go.pop(context);
      showSnackBar(context, "Something went wrong: ${e.toString()}");
      ErrorHandler.catchException(context, e);
    }
  }

  updatePassword({
    required String newPass,
    required BuildContext context,
  }) async {
    CustomDailog.loadingDailog(context);
    try {
      final data = await postFunction(
        {"password": newPass},
        Api.user.updatePassword,
        authorization: true,
        tokenKey: SharedPrefHelper.utils.authorizedTokenTemp,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );

      if (data != null && data['success'] == true) {
        if (context.mounted) {
          // String token = data["data"]["token"];
          // storeSessionTemp(
          //   token: token,
          // );
          showSnackBar(context, data['message']);
          Go.namedReplace(context, RouteName.loginScreen);
        }
      } else {
        Go.pop(context);
        ErrorHandler.apiException(
          context,
          data['message'] ?? "user forgot password failed",
        );
      }
    } catch (e) {
      Go.pop(context);
      ErrorHandler.catchException(context, e);
    }
  }

  getProfile() async {
    try {
      isLoadingProfile = true;
      notifyListeners();
      var data = await getfunction(
        authorization: true,
        tokenKey: SharedPrefHelper.utils.authorizedToken,
        Api.user.getprofile,
        header: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (data['success'] == true) {
        profile = UserModel.fromJson(data['user']);
        firstNameCtrl.text = profile?.firstName ?? "";
        lastNameCtrl.text = profile?.lastName ?? "";
        emailCtrl.text = profile?.email ?? "";
        phoneCtrl.text = profile?.phone ?? "";
        isLoadingProfile = false;
        notifyListeners();
      } else {}
    } catch (e) {
      isLoadingProfile = false;
      notifyListeners();
      log("Something went wrong");
    }
  }

  updateProfile({String? imgPath, required BuildContext context}) async {
    CustomDailog.loadingDailog(context);
    try {
      if (imgPath != null) {
        log(imgPath.toString());
        var data = await postFunctionMultipart(
          api: Api.user.updateProfile,
          headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
          body: {
            "firstName": firstNameCtrl.text,
            "lastName": lastNameCtrl.text,
            "phone": phoneCtrl.text,
          },
          authorization: true,
          file: File(imgPath),
          field: "profile",
          tokenKey: SharedPrefHelper.utils.authorizedToken,
        );
        if (data['success'] == true) {
          showSnackBar(context, data['message']);
          getProfile();
          Go.pop(context);
          Go.pop(context);
        } else {
          Go.pop(context);
          ErrorHandler.apiException(
            context,
            data['message'] ?? "Something went wrong",
          );
        }
      } else {
        var data = await postFunction(
          {
            "firstName": firstNameCtrl.text,
            "lastName": lastNameCtrl.text,
            "phone": phoneCtrl.text,
          },
          Api.user.updateProfile,
          headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
          authorization: true,
          tokenKey: SharedPrefHelper.utils.authorizedToken,
        );
        if (data['success'] == true) {
          showSnackBar(context, data['message']);
          getProfile();
          Go.pop(context);
          Go.pop(context);
        } else {
          Go.pop(context);
          ErrorHandler.apiException(
            context,
            data['message'] ?? "Something went wrong",
          );
        }
      }
    } catch (e) {
      Go.pop(context);
      ErrorHandler.catchException(context, e);
    }
  }

  changePassowrd({
    required BuildContext context,
    required String oldPass,
    required String newPass,
  }) async {
    CustomDailog.loadingDailog(context);
    try {
      final response = await postFunction(
        {"password": oldPass, "newPassword": newPass},
        Api.user.changePassowrd,
        tokenKey: SharedPrefHelper.utils.authorizedToken,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (response != null && response['success'] == true) {
        showSnackBar(context, response['message']);
        Go.pop(context);
        Go.pop(context);
      } else {
        Go.pop(context);
        ErrorHandler.apiException(
          context,
          response['message'] ?? "Something went wrong",
        );
      }
    } catch (e) {
      Go.pop(context);
      ErrorHandler.catchException(context, e);
    }
  }

  logout(BuildContext context) async {
    CustomDailog.loadingDailog(context);

    try {
      await Future.delayed(const Duration(milliseconds: 500));

      await SharedPrefHelper.remove(SharedPrefHelper.utils.authorizedToken);
      await SharedPrefHelper.putBool("isLoggedIn", false);
      Navigator.of(context, rootNavigator: true).pop(); // Close loader

      GoRouter.of(context).goNamed(RouteName.welcomeScreen);
    } catch (e) {
      Navigator.pop(context);
      showSnackBar(context, "Logout failed. Try again.");
    }
  }

  storeSessionTemp({required String token}) {
    SharedPrefHelper.putString(
      SharedPrefHelper.utils.authorizedTokenTemp,
      token,
    );
    SharedPrefHelper.putString(
      SharedPrefHelper.utils.userType,
      UserType.user.name,
    );
  }

  storeSession({required String token, required BuildContext context}) async {
    SharedPrefHelper.putString(SharedPrefHelper.utils.authorizedToken, token);
    await Provider.of<AuthPro>(context, listen: false).getProfile();
  }
}
