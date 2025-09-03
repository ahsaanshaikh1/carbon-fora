import 'package:carbon_fora/provider/auth/auth_pro.dart';
import 'package:carbon_fora/utils/helper/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/route_structure/go_router.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/custom_text_field.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FilledBox(
            height: 300,
            width: double.infinity,
            gradient: LinearGradient(
              colors: [Palette.primaryColor, Palette.secondaryColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.zero,
            child: Stack(
              children: [
                Positioned(
                  left: -30,
                  top: -20,
                  child: FilledBox(
                    height: 200,
                    width: 200,
                    color: themegreycolor.withAlpha(10),
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  left: -30,
                  top: -20,
                  child: FilledBox(
                    height: 300,
                    width: 300,
                    color: themegreycolor.withAlpha(10),
                    shape: BoxShape.circle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      15.kH,
                      FilledBox(
                        onTap: () {
                          Go.pop(context);
                        },
                        height: 55,
                        width: 55,
                        borderRadius: BorderRadius.circular(20),
                        padding: EdgeInsets.zero,
                        color: themewhitecolor.withOpacity(0.2),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Center(
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: themegreycolor,
                            ),
                          ),
                        ),
                      ),
                      40.kH,
                      Center(
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(
                            color: themewhitecolor,
                            fontSize: largefontsize4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      7.kH,
                      const Text(
                        "Enter your registered email below to receive password reset instruction",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: themewhitecolor,
                          fontSize: mediumfontsize5,
                          fontWeight: boldfontweightvar1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: FilledBox(
              height: double.infinity,
              width: double.infinity,
              color: themewhitecolor,
              padding: EdgeInsets.zero,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        15.kH,
                        Center(
                          child: SvgPicture.asset(
                            "assets/images/svg/frogot-pass.svg",
                          ),
                        ),
                        35.kH,
                        CustomTextField(
                          validator: ValidatorHelper.emailValidator,
                          controller: emailCtrl,
                          textInputType: TextInputType.text,
                          hintText: "Email",
                          isOutlinedInputBorder: true,
                          padding: EdgeInsets.all(18),
                          filled: true,
                          fillColor: themetextfieldolor,
                          focusedBorderColor: Palette.themecolor,
                          borderWidth: 1.5,
                        ),
                        35.kH,
                        CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Provider.of<AuthPro>(
                                context,
                                listen: false,
                              ).forgotPassword(
                                email: emailCtrl.text,
                                context: context,
                              );
                            }
                            // Go.named(context, RouteName.resetPasswordScreen);
                          },
                          height: 60,
                          buttongradientColor: LinearGradient(
                            colors: [
                              Palette.primaryColor,
                              Palette.secondaryColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          child: const Text(
                            "Send",
                            style: TextStyle(
                              color: themewhitecolor,
                              fontSize: mediumfontsize1,
                              fontWeight: boldfontweight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          20.kH,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text.rich(
                TextSpan(
                  text: "You remember your password?  ",
                  style: const TextStyle(
                    color: themegreytextcolor,
                    fontSize: mediumfontsize4,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            Go.named(context, RouteName.loginScreen),
                      text: "Login",
                      style: const TextStyle(
                        color: Palette.themecolor,
                        fontSize: mediumfontsize3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
