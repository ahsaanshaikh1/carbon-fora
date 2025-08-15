import 'package:carbon_fora/provider/auth_pro.dart';
import 'package:carbon_fora/utils/helper/validator.dart';
import 'package:carbon_fora/widgets/custom_icon_button.dart';
import 'package:carbon_fora/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool oldvisiblePass = true;
  bool pasvisiblePass = true;
  bool confvisiblePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(color: Palette.primaryColor),
        padding: EdgeInsets.all(14),
        child: CustomButton(
          onTap: () {
            if (formKey.currentState!.validate()) {
              Provider.of<AuthPro>(context, listen: false).changePassowrd(
                context: context,
                oldPass: oldPasswordController.text,
                newPass: passwordController.text,
              );
            }
          },
          height: 55,
          width: double.infinity,
          buttoncolor: themewhitecolor,
          borderRadius: BorderRadius.circular(30),
          child: const Center(
            child: Text(
              "Update",
              style: TextStyle(
                color: Palette.primaryColor,
                fontSize: mediumfontsize3,
                fontWeight: boldfontweight,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8AA2), Color(0xFF4834AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Color(0xfe1D8AA2),
                              ),
                              color: Color(0xfe1D8AA2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Color.fromARGB(252, 149, 215, 231),
                            ),
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  30.kH,
                  const Text(
                    "Current Password",
                    style: TextStyle(
                      fontSize: mediumfontsize3,
                      color: themewhitecolor,
                      fontWeight: boldfontweightvar1,
                    ),
                  ),
                  5.kH,
                  CustomTextField(
                    controller: oldPasswordController,
                    textInputType: TextInputType.text,
                    hintText: "Current Password",
                    outlineBorderRadius: 30,
                    padding: const EdgeInsets.all(18.0),
                    isOutlinedInputBorder: true,
                    hintTextStyle: TextStyle(color: themewhitecolor),
                    cursorTextStyle: TextStyle(color: themewhitecolor),
                    enabledBorderColor: themewhitecolor,
                    focusedBorderColor: themewhitecolor,
                    validator: ValidatorHelper.passwordValidator,
                    obscureText: oldvisiblePass,
                    suffix: CustomIconButton(
                      onTap: () {
                        setState(() {
                          oldvisiblePass = !oldvisiblePass;
                        });
                      },
                      child: Icon(
                        oldvisiblePass == false
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash_fill,
                        color: themewhitecolor,
                      ),
                    ),
                  ),
                  20.kH,
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: mediumfontsize3,
                      color: themewhitecolor,
                      fontWeight: boldfontweightvar1,
                    ),
                  ),
                  5.kH,
                  CustomTextField(
                    controller: passwordController,
                    textInputType: TextInputType.text,
                    hintText: "Password",
                    outlineBorderRadius: 30,
                    hintTextStyle: TextStyle(color: themewhitecolor),
                    cursorTextStyle: TextStyle(color: themewhitecolor),
                    padding: const EdgeInsets.all(18.0),
                    isOutlinedInputBorder: true,
                    enabledBorderColor: themewhitecolor,
                    focusedBorderColor: themewhitecolor,
                    validator: ValidatorHelper.passwordValidator,
                    obscureText: pasvisiblePass,
                    suffix: CustomIconButton(
                      onTap: () {
                        setState(() {
                          pasvisiblePass = !pasvisiblePass;
                        });
                      },
                      child: Icon(
                        pasvisiblePass == false
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash_fill,
                        color: themewhitecolor,
                      ),
                    ),
                  ),
                  20.kH,
                  const Text(
                    "Confirm Password",
                    style: TextStyle(
                      fontSize: mediumfontsize3,
                      color: themewhitecolor,
                      fontWeight: boldfontweightvar1,
                    ),
                  ),
                  5.kH,
                  CustomTextField(
                    textInputType: TextInputType.text,
                    hintText: "Confirm Password",
                    outlineBorderRadius: 30,
                    hintTextStyle: TextStyle(color: themewhitecolor),
                    cursorTextStyle: TextStyle(color: themewhitecolor),
                    padding: EdgeInsets.all(18.0),
                    isOutlinedInputBorder: true,
                    enabledBorderColor: themewhitecolor,
                    focusedBorderColor: themewhitecolor,
                    obscureText: confvisiblePass,
                    suffix: CustomIconButton(
                      onTap: () {
                        setState(() {
                          confvisiblePass = !confvisiblePass;
                        });
                      },
                      child: Icon(
                        confvisiblePass == false
                            ? CupertinoIcons.eye
                            : CupertinoIcons.eye_slash_fill,
                        color: themewhitecolor,
                      ),
                    ),
                  ),
                  30.kH,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
