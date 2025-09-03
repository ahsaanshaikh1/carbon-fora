import 'package:carbon_fora/model/product_model.dart';
import 'package:carbon_fora/model/voucher_model.dart';
import 'package:carbon_fora/provider/voucher/voucher_pro.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/checkout/checkout_screen.dart';
import 'package:carbon_fora/views/redeem/redemption_confirm.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetail extends StatefulWidget {
  final ProductModel model;
  const ProductDetail({super.key, required this.model});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Future<Object?> logout(Size size) {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          scrollable: true,
          surfaceTintColor: themewhitecolor,
          backgroundColor: themewhitecolor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0)),
          ),
          titlePadding: const EdgeInsets.all(24),
          actionsPadding: const EdgeInsets.all(0),
          buttonPadding: const EdgeInsets.all(0),
          title: Form(
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      "Are you sure ?",
                      textScaleFactor: 1.0,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: themeblackcolor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  40.kH,
                  Row(
                    children: [
                      Expanded(
                        child: FilledBox(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          height: 55,
                          color: themewhitecolor,
                          padding: EdgeInsets.zero,
                          boxShadow: const [
                            BoxShadow(color: themegreycolor, blurRadius: 10),
                          ],
                          child: const Center(
                            child: Text(
                              "Cancel",
                              textScaleFactor: 1.0,
                              style: TextStyle(
                                fontSize: mediumfontsize4,
                                fontWeight: boldfontweight,
                              ),
                            ),
                          ),
                        ),
                      ),
                      20.kW,
                      Expanded(
                        child: CustomButton(
                          onTap: () {
                            Provider.of<VoucherPro>(
                              context,
                              listen: false,
                            ).voucherRedeem(
                              context: context,
                              voucherId: widget.model.id,
                            );
                          },
                          height: 55,
                          borderRadius: BorderRadius.circular(12),
                          child: const Text(
                            "Yes",
                            textScaleFactor: 1.0,
                            style: TextStyle(
                              color: themewhitecolor,
                              fontSize: mediumfontsize4,
                              fontWeight: boldfontweight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomButton(String text, BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => RedemptionConfirmation()),
          // );
          // logout(MediaQuery.sizeOf(context));
          Go.route(context, CheckoutScreen(model: widget.model));
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                        "Product Detail",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: themewhitecolor,
                    border: Border.all(width: 1, color: themewhitecolor),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Image.network(
                      widget.model.brand.companyLogo,
                      width: double.infinity, // full screen width
                      height: 320, // fixed height jaisa chahiye (adjust karen)
                      fit: BoxFit
                          .fitWidth, // width fit karega, height maintain rahegi
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.model.name,
                  style: TextStyle(
                    fontSize: 18,
                    color: themewhitecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  widget.model.description,
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                SizedBox(height: 20),
                Text(
                  "Cost: ${widget.model.creditCost} Carbon Credits",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                SizedBox(height: 20),
                Text(
                  "Price: PKR ${widget.model.retailPrice}",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                // SizedBox(height: 20),
                // Text(
                //   "Delivery - Instant via email or SMS",
                //   style: TextStyle(fontSize: 14, color: themewhitecolor),
                // ),
                SizedBox(height: 20),
                // Text(
                //   "Validity - ${widget.model.validity} days",
                //   style: TextStyle(fontSize: 14, color: themewhitecolor),
                // ),
                // SizedBox(height: 20),
                Text(
                  "Brand - ${widget.model.brand.name}",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                SizedBox(height: 30),
                // const Spacer(),
                _bottomButton("Purchase", context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
