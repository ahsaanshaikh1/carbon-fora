import 'dart:io';

import 'package:carbon_fora/provider/auth_pro.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/utils/helper/validator.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/custom_text_field.dart';
import 'package:carbon_fora/widgets/shimmer_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  Future cameraImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final pickImagefromgallery = File(image.path);
      setState(() => this.image = pickImagefromgallery);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image:$e');
    }
  }

  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        height: 90,
        decoration: const BoxDecoration(color: Palette.primaryColor),
        padding: EdgeInsets.all(14),
        child: Consumer<AuthPro>(
          builder: (context, pro, child) {
            return pro.isLoadingProfile
                ? const SizedBox()
                : CustomButton(
                    onTap: () {
                      if (fKey.currentState!.validate()) {
                        pro.updateProfile(
                          context: context,
                          imgPath: image != null ? image!.path : null,
                        );
                      }
                    },
                    buttoncolor: themewhitecolor,
                    borderRadius: BorderRadius.circular(16),
                    child: Text(
                      "Update",
                      style: TextStyle(
                        fontSize: mediumfontsize1,
                        color: Palette.primaryColor,
                        fontWeight: boldfontweight,
                      ),
                    ),
                  );
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8AA2), Color(0xFF4834AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Consumer<AuthPro>(
          builder: (context, pro, child) {
            return SafeArea(
              child: Form(
                key: fKey,
                child: Column(
                  children: [
                    _buildHeader(context),
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            20.kH,
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                image != null
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundImage: FileImage(image!),
                                      )
                                    : pro.profile?.profile != null &&
                                          pro.profile!.profile!.isNotEmpty
                                    ? CustomCachedImage(
                                        url: UrlHelper.resolve(
                                          pro.profile!.profile,
                                        ),
                                        height: 120,
                                        width: 120,
                                        borderRadius: BorderRadius.circular(60),
                                      )
                                    : const CircleAvatar(
                                        backgroundColor: themegreycolor,
                                        backgroundImage: NetworkImage(
                                          "https://cdn.pixabay.com/photo/2023/02/18/11/00/icon-7797704_640.png",
                                        ),
                                        radius: 60,
                                      ),
                                // Container(
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       width: 1.5,
                                //       color: Colors.white,
                                //     ),
                                //     borderRadius: BorderRadius.circular(60),
                                //   ),
                                //   padding: const EdgeInsets.all(3),
                                //   child: const CircleAvatar(
                                //     radius: 60,
                                //     backgroundColor: Colors.white,
                                //     backgroundImage: AssetImage(
                                //       'assets/images/png/profile.png',
                                //     ),
                                //   ),
                                // ),
                                Positioned(
                                  child: InkWell(
                                    onTap: () async {
                                      cameraImage();
                                    },
                                    child: const CircleAvatar(
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
                            40.kH,
                            CustomTextField(
                              controller: pro.firstNameCtrl,
                              textInputType: TextInputType.text,
                              hintText: 'First Name',
                              cursorTextStyle: TextStyle(
                                color: themewhitecolor,
                              ),
                              hintTextStyle: TextStyle(color: themewhitecolor),
                              enabledBorderColor: themewhitecolor,
                              focusedBorderColor: themewhitecolor,
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              padding: EdgeInsets.all(16),
                              outlineBorderRadius: 14,
                              validator: ValidatorHelper.validator,
                              // prefix: Icon(
                              //   Icons.person_outline,
                              //   color: themewhitecolor,
                              // ),
                            ),
                            20.kH,
                            CustomTextField(
                              controller: pro.lastNameCtrl,
                              textInputType: TextInputType.text,
                              hintText: 'Last Name',
                              hintTextStyle: TextStyle(color: themewhitecolor),
                              cursorTextStyle: TextStyle(
                                color: themewhitecolor,
                              ),
                              enabledBorderColor: themewhitecolor,
                              focusedBorderColor: themewhitecolor,
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              padding: EdgeInsets.all(16),
                              outlineBorderRadius: 14,
                              validator: ValidatorHelper.validator,
                              // prefix: Icon(
                              //   Icons.person_outline,
                              //   color: themewhitecolor,
                              // ),
                            ),
                            20.kH,
                            CustomTextField(
                              controller: pro.emailCtrl,
                              textInputType: TextInputType.text,
                              hintText: 'Email',
                              readOnly: true,
                              hintTextStyle: TextStyle(color: themewhitecolor),
                              cursorTextStyle: TextStyle(
                                color: themewhitecolor,
                              ),
                              enabledBorderColor: themewhitecolor,
                              focusedBorderColor: themewhitecolor,
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              padding: EdgeInsets.all(16),
                              outlineBorderRadius: 14,
                              validator: ValidatorHelper.validator,
                            ),
                            20.kH,
                            CustomTextField(
                              controller: pro.phoneCtrl,
                              textInputType: TextInputType.text,
                              hintText: 'phone',
                              hintTextStyle: TextStyle(color: themewhitecolor),
                              cursorTextStyle: TextStyle(
                                color: themewhitecolor,
                              ),
                              enabledBorderColor: themewhitecolor,
                              focusedBorderColor: themewhitecolor,
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.1),
                              padding: EdgeInsets.all(16),
                              outlineBorderRadius: 14,
                              validator: ValidatorHelper.validator,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
                "Edit Profile",
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

class UrlHelper {
  static const String _baseUrl = "https://xeno-hash.s3.us-east-1.amazonaws.com";

  static String resolve(String? path) {
    if (path == null || path.trim().isEmpty) return "";

    path = path.trim();

    // If path starts with full URL but with only one slash, fix it
    if (path.startsWith("https:/") && !path.startsWith("https://")) {
      path = path.replaceFirst("https:/", "https://");
    }

    // If it's now a proper URL, return it
    if (path.startsWith("http://") || path.startsWith("https://")) {
      return path;
    }

    // Otherwise, treat it as a relative path and prepend baseUrl
    return "$_baseUrl${path.startsWith("/") ? "" : "/"}$path";
  }
}
