import 'package:carbon_fora/provider/auth_pro.dart';
import 'package:carbon_fora/utils/helper/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/custom_icon_button.dart';
import 'package:carbon_fora/widgets/custom_text_field.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:provider/provider.dart';

class NewPasswordScreen extends StatefulWidget {
  final String forgot;
  const NewPasswordScreen({Key? key, required this.forgot}) : super(key: key);

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController passwordCtrl = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visiblePass = true;
  bool confirmBisiblePass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FilledBox(
            height: 300,
            width: double.infinity,
            color: Palette.themecolor,
            borderRadius: BorderRadius.zero,
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
                const Text(
                  "Reset Password",
                  style: TextStyle(
                    color: themewhitecolor,
                    fontSize: largefontsize4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                2.kH,
                const Text(
                  "Sign in-up to enjoy the best managing experience",
                  style: TextStyle(
                    color: themewhitecolor,
                    fontSize: mediumfontsize5,
                    fontWeight: boldfontweightvar1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 220),
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
                        35.kH,
                        CustomTextField(
                          validator: ValidatorHelper.passwordValidator,
                          controller: passwordCtrl,
                          textInputType: TextInputType.text,
                          hintText: "Enter Password",
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
                          hintText: "Enter Confirm Password",
                          isOutlinedInputBorder: true,
                          padding: const EdgeInsets.all(18),
                          enabledBorderColor: themegreycolor,
                          focusedBorderColor: Palette.themecolor,
                          borderWidth: 1.5,
                          obscureText: confirmBisiblePass,
                          suffix: CustomIconButton(
                            onTap: () {
                              setState(() {
                                confirmBisiblePass = !confirmBisiblePass;
                              });
                            },
                            child: Icon(
                              confirmBisiblePass == false
                                  ? CupertinoIcons.eye
                                  : CupertinoIcons.eye_slash_fill,
                              color: themegreytextcolor,
                            ),
                          ),
                        ),
                        35.kH,
                        CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              Provider.of<AuthPro>(
                                context,
                                listen: false,
                              ).updatePassword(
                                newPass: passwordCtrl.text,
                                context: context,
                              );
                            }
                          },
                          height: 60,
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
        ],
      ),
    );
  }
}
