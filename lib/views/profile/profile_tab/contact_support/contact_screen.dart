import 'package:carbon_fora/provider/contact/contact_pro.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/utils/helper/validator.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final fKey = GlobalKey<FormState>();
  final fNameCtrl = TextEditingController();
  final lNameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final quesCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: SafeArea(
          child: Form(
            key: fKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                20.kH,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Contact our support",
                        textScaleFactor: 1.0,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: themewhitecolor,
                        ),
                      ),
                      20.kH,
                      CustomTextField(
                        textInputType: TextInputType.text,
                        hintText: "First Name",
                        controller: fNameCtrl,
                        outlineBorderRadius: 30,
                        validator: ValidatorHelper.validator,
                        padding: const EdgeInsets.all(18.0),
                        isOutlinedInputBorder: true,
                        hintTextStyle: TextStyle(color: themewhitecolor),
                        cursorTextStyle: TextStyle(color: themewhitecolor),
                        enabledBorderColor: themewhitecolor,
                        focusedBorderColor: themewhitecolor,
                      ),
                      20.kH,
                      CustomTextField(
                        textInputType: TextInputType.text,
                        validator: ValidatorHelper.validator,
                        hintText: "Last Name",
                        controller: lNameCtrl,
                        outlineBorderRadius: 30,
                        padding: const EdgeInsets.all(18.0),
                        isOutlinedInputBorder: true,
                        hintTextStyle: TextStyle(color: themewhitecolor),
                        cursorTextStyle: TextStyle(color: themewhitecolor),
                        enabledBorderColor: themewhitecolor,
                        focusedBorderColor: themewhitecolor,
                      ),
                      20.kH,
                      CustomTextField(
                        textInputType: TextInputType.phone,
                        hintText: "Your Phone",
                        validator: ValidatorHelper.phoneValidator,
                        controller: phoneCtrl,
                        outlineBorderRadius: 30,
                        padding: const EdgeInsets.all(18.0),
                        isOutlinedInputBorder: true,
                        hintTextStyle: TextStyle(color: themewhitecolor),
                        cursorTextStyle: TextStyle(color: themewhitecolor),
                        enabledBorderColor: themewhitecolor,
                        focusedBorderColor: themewhitecolor,
                      ),
                      20.kH,
                      CustomTextField(
                        textInputType: TextInputType.emailAddress,
                        hintText: "Your Email",
                        validator: ValidatorHelper.emailValidator,
                        outlineBorderRadius: 30,
                        controller: emailCtrl,
                        padding: const EdgeInsets.all(18.0),
                        isOutlinedInputBorder: true,
                        hintTextStyle: TextStyle(color: themewhitecolor),
                        cursorTextStyle: TextStyle(color: themewhitecolor),
                        enabledBorderColor: themewhitecolor,
                        focusedBorderColor: themewhitecolor,
                      ),
                      20.kH,
                      CustomTextField(
                        maxLines: 5,
                        textInputType: TextInputType.text,
                        hintText: "Ask a question",
                        validator: ValidatorHelper.validator,
                        outlineBorderRadius: 30,
                        controller: quesCtrl,
                        padding: const EdgeInsets.all(18.0),
                        isOutlinedInputBorder: true,
                        hintTextStyle: TextStyle(color: themewhitecolor),
                        cursorTextStyle: TextStyle(color: themewhitecolor),
                        enabledBorderColor: themewhitecolor,
                        focusedBorderColor: themewhitecolor,
                      ),
                      25.kH,
                      CustomButton(
                        onTap: () {
                          if (fKey.currentState!.validate()) {
                            Provider.of<ContactPro>(
                              context,
                              listen: false,
                            ).contact(
                              context: context,
                              email: emailCtrl.text,
                              fName: fNameCtrl.text,
                              lName: lNameCtrl.text,
                              phone: phoneCtrl.text,
                              question: quesCtrl.text,
                            );
                          }
                        },
                        height: 60,
                        width: double.infinity,
                        buttoncolor: themewhitecolor,
                        borderRadius: BorderRadius.circular(30),
                        child: const Center(
                          child: Text(
                            "Submit",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: Palette.primaryColor,
                              fontSize: mediumfontsize2,
                              fontWeight: boldfontweight,
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
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: SizedBox(
        height: 50,
        child: Stack(
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
                    border: Border.all(width: 2, color: Color(0xfe1D8AA2)),
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
                "Contact Us",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
