import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/views/redeem/redemption_confirm.dart';
import 'package:flutter/material.dart';

class VoucherDetail extends StatefulWidget {
  const VoucherDetail({super.key});

  @override
  State<VoucherDetail> createState() => _VoucherDetailState();
}

class _VoucherDetailState extends State<VoucherDetail> {
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
                        "Voucher Detail",
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
                    child: Image.asset(
                      "assets/images/png/travel.png",
                      width: double.infinity, // full screen width
                      height: 320, // fixed height jaisa chahiye (adjust karen)
                      fit: BoxFit
                          .fitWidth, // width fit karega, height maintain rahegi
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Travel Voucher",
                  style: TextStyle(
                    fontSize: 18,
                    color: themewhitecolor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Rs: 1500 off on domestic bus travel with BookMe.pk. Valid on app and web.",
                  maxLines: 2,
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                SizedBox(height: 20),
                Text(
                  "Cost: 40 Carbon Credits",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                SizedBox(height: 20),
                Text(
                  "Estimated Value: \$5.20",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                SizedBox(height: 20),
                Text(
                  "Delivery - Instant via email or SMS",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                SizedBox(height: 20),
                Text(
                  "Validity - e.g. Valid till Aug 31, 2025",
                  style: TextStyle(fontSize: 14, color: themewhitecolor),
                ),
                SizedBox(height: 30),
                // const Spacer(),
                _bottomButton("Confirm and Redeem Voucher", context),
              ],
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RedemptionConfirmation()),
          );
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
}
