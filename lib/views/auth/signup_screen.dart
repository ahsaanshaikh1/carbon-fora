import 'package:carbon_fora/provider/auth_pro.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/route_structure/go_router.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/utils/helper/validator.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/custom_icon_button.dart';
import 'package:carbon_fora/widgets/custom_text_field.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastnNameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visiblePass = true;
  bool confirmVisiblePass = true;
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themewhitecolor,
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
              clipBehavior: Clip.none,
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
                          "Sign Up",
                          style: TextStyle(
                            color: themewhitecolor,
                            fontSize: largefontsize4,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      7.kH,
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: const Text(
                            "Enter your registered email below to receive password reset instruction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: themewhitecolor,
                              fontSize: mediumfontsize5,
                              fontWeight: boldfontweightvar1,
                            ),
                          ),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.kH,
                        CustomTextField(
                          validator: ValidatorHelper.validator,
                          controller: firstNameCtrl,
                          textInputType: TextInputType.text,
                          hintText: "First Name",
                          isOutlinedInputBorder: true,
                          padding: const EdgeInsets.all(18),
                          focusedBorderColor: Palette.themecolor,
                          borderWidth: 1.5,
                          filled: true,
                          fillColor: themetextfieldolor,
                        ),
                        20.kH,
                        CustomTextField(
                          validator: ValidatorHelper.validator,
                          controller: lastnNameCtrl,
                          textInputType: TextInputType.text,
                          hintText: "Last Name",
                          isOutlinedInputBorder: true,
                          padding: const EdgeInsets.all(18),
                          focusedBorderColor: Palette.themecolor,
                          borderWidth: 1.5,
                          filled: true,
                          fillColor: themetextfieldolor,
                        ),
                        20.kH,
                        CustomTextField(
                          validator: ValidatorHelper.emailValidator,
                          controller: emailCtrl,
                          textInputType: TextInputType.text,
                          hintText: "Email",
                          isOutlinedInputBorder: true,
                          padding: const EdgeInsets.all(18),
                          focusedBorderColor: Palette.themecolor,
                          borderWidth: 1.5,
                          filled: true,
                          fillColor: themetextfieldolor,
                        ),
                        20.kH,
                        CustomTextField(
                          validator: ValidatorHelper.phoneValidator,
                          controller: phoneCtrl,
                          textInputType: TextInputType.text,
                          hintText: "Phone",
                          isOutlinedInputBorder: true,
                          padding: const EdgeInsets.all(18),
                          focusedBorderColor: Palette.themecolor,
                          borderWidth: 1.5,
                          filled: true,
                          fillColor: themetextfieldolor,
                        ),
                        20.kH,
                        CustomTextField(
                          validator: ValidatorHelper.passwordValidator,
                          controller: passwordCtrl,
                          textInputType: TextInputType.text,
                          hintText: "Password",
                          filled: true,
                          fillColor: themetextfieldolor,
                          isOutlinedInputBorder: true,
                          padding: const EdgeInsets.all(18),
                          enabledBorderColor: themegreycolor,
                          focusedBorderColor: Palette.themecolor,
                          borderWidth: 1.5,
                          obscureText: visiblePass,
                          suffix: CustomIconButton(
                            onTap: () {
                              setState(() {
                                visiblePass = !visiblePass;
                              });
                            },
                            child: Icon(
                              visiblePass == false
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash_fill,
                              color: themegreytextcolor,
                            ),
                          ),
                        ),
                        20.kH,
                        CustomTextField(
                          textInputType: TextInputType.text,
                          hintText: "Confirm Password",
                          filled: true,
                          fillColor: themetextfieldolor,
                          isOutlinedInputBorder: true,
                          padding: const EdgeInsets.all(18),
                          enabledBorderColor: themegreycolor,
                          focusedBorderColor: Palette.themecolor,
                          borderWidth: 1.5,
                          obscureText: confirmVisiblePass,
                          suffix: CustomIconButton(
                            onTap: () {
                              setState(() {
                                confirmVisiblePass = !confirmVisiblePass;
                              });
                            },
                            child: Icon(
                              confirmVisiblePass == false
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash_fill,
                              color: themegreytextcolor,
                            ),
                          ),
                        ),
                        15.kH,
                        Row(
                          children: [
                            Theme(
                              data: ThemeData(
                                checkboxTheme: CheckboxThemeData(
                                  side: BorderSide(color: themeblackcolor),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                              ),
                              child: Checkbox(
                                activeColor: Palette.themecolor,
                                checkColor: themeblackcolor,
                                value: remember,
                                onChanged: (bool? value) {
                                  setState(() {
                                    remember = value ?? false;
                                  });
                                },
                              ),
                            ),
                            const Text(
                              "Remember me",
                              style: TextStyle(
                                fontSize: mediumfontsize1,
                                color: themeblackcolor,
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        30.kH,
                        CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Provider.of<AuthPro>(
                                context,
                                listen: false,
                              ).signUp(
                                context: context,
                                firstName: firstNameCtrl.text,
                                lastName: lastnNameCtrl.text,
                                email: emailCtrl.text,
                                phone: phoneCtrl.text,
                                password: passwordCtrl.text,
                              );
                            }
                          },
                          buttongradientColor: LinearGradient(
                            colors: [
                              Palette.primaryColor,
                              Palette.secondaryColor,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          height: 60,
                          borderRadius: BorderRadius.circular(12),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: themewhitecolor,
                              fontSize: mediumfontsize1,
                              fontWeight: boldfontweight,
                            ),
                          ),
                        ),
                        20.kH,
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text.rich(
                            TextSpan(
                              text: "Already have an account?  ",
                              style: const TextStyle(
                                color: themegreytextcolor,
                                fontSize: mediumfontsize4,
                              ),
                              children: [
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => Go.named(
                                      context,
                                      RouteName.loginScreen,
                                    ),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
