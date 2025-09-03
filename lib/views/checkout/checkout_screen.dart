import 'package:carbon_fora/model/product_model.dart';
import 'package:carbon_fora/model/voucher_model.dart';
import 'package:carbon_fora/provider/voucher/voucher_pro.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/utils/helper/validator.dart';
import 'package:carbon_fora/views/redeem/redemption_confirm.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/custom_text_field.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatefulWidget {
  final ProductModel model;
  const CheckoutScreen({super.key, required this.model});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  Widget _bottomButton(String text, BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          if (fKey.currentState!.validate()) {
            Provider.of<VoucherPro>(context, listen: false).productPurchase(
              context: context,
              productId: widget.model.id,
              name: nameCtrl.text,
              email: emailCtrl.text,
              phone: phoneCtrl.text,
              address: addressCtrl.text,
            );
          }
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => RedemptionConfirmation()),
          // );
          // logout(MediaQuery.sizeOf(context));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Color(0xfe402BB5),
          minimumSize: const Size(double.infinity, 58),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final fKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8AA2), Color(0xFF4834AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: fKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 14,
                              top: 8,
                              bottom: 8,
                              right: 7,
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
                      ],
                    ),
                    const Center(
                      child: Text(
                        "Checkout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  "Name",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                10.kH,
                CustomTextField(
                  textInputType: TextInputType.text,
                  hintText: "Name",
                  controller: nameCtrl,
                  isOutlinedInputBorder: true,
                  padding: const EdgeInsets.all(18),
                  focusedBorderColor: Palette.themecolor,

                  borderWidth: 1.5,
                  // enabledBorderColor: Palette.themecolor,
                  filled: true,
                  fillColor: themetextfieldolor,
                  // controller: emailCtrl,
                  validator: ValidatorHelper.validator,
                ),
                20.kH,
                Text(
                  "Email",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                10.kH,
                CustomTextField(
                  textInputType: TextInputType.emailAddress,
                  hintText: "Email",
                  controller: emailCtrl,
                  isOutlinedInputBorder: true,
                  padding: const EdgeInsets.all(18),
                  focusedBorderColor: Palette.themecolor,

                  borderWidth: 1.5,
                  // enabledBorderColor: Palette.themecolor,
                  filled: true,
                  fillColor: themetextfieldolor,
                  // controller: emailCtrl,
                  validator: ValidatorHelper.emailValidator,
                ),
                20.kH,
                Text(
                  "Phone",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                10.kH,
                CustomTextField(
                  textInputType: TextInputType.phone,
                  hintText: "Phone",
                  controller: phoneCtrl,
                  isOutlinedInputBorder: true,
                  padding: const EdgeInsets.all(18),
                  focusedBorderColor: Palette.themecolor,

                  borderWidth: 1.5,
                  // enabledBorderColor: Palette.themecolor,
                  filled: true,
                  fillColor: themetextfieldolor,
                  // controller: emailCtrl,
                  validator: ValidatorHelper.phoneValidator,
                ),
                20.kH,
                Text(
                  "Address",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                10.kH,
                CustomTextField(
                  textInputType: TextInputType.text,
                  hintText: "Address",
                  controller: addressCtrl,
                  isOutlinedInputBorder: true,
                  padding: const EdgeInsets.all(18),
                  focusedBorderColor: Palette.themecolor,

                  borderWidth: 1.5,
                  // enabledBorderColor: Palette.themecolor,
                  filled: true,
                  fillColor: themetextfieldolor,
                  // controller: emailCtrl,
                  validator: ValidatorHelper.validator,
                ),
                Spacer(),
                _bottomButton("Purchase", context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
