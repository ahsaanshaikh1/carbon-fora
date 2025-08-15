import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/redeem/redemption_history.dart';
import 'package:carbon_fora/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RedemptionConfirmation extends StatefulWidget {
  const RedemptionConfirmation({super.key});

  @override
  State<RedemptionConfirmation> createState() => _RedemptionConfirmationState();
}

class _RedemptionConfirmationState extends State<RedemptionConfirmation> {
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
                        "Redemption Confirmation",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Center(child: Image.asset("assets/images/png/check2.png")),
                SizedBox(height: 30),
                Center(
                  child: Text(
                    "Success! Your voucher has\n been sent to your registered\n email and phone.",
                    style: TextStyle(
                      fontSize: 20,
                      color: themewhitecolor,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ),
                SizedBox(height: 40),

                GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 65,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white70),
                        borderRadius: BorderRadius.circular(17),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            index == 0
                                ? "BookMe.pk"
                                : index == 1
                                ? "\$1500 off"
                                : index == 2
                                ? "xxxxxxxx"
                                : "Aug 31, 2025",
                            style: TextStyle(
                              color: themewhitecolor,
                              fontSize: 18,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          index == 2 ? 8.kW : 0.kW,
                          index == 2
                              ? Image.asset(
                                  "assets/images/png/copy.png",
                                  height: 16,
                                )
                              : SizedBox(),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 40),
                Text(
                  "(optional link to partner's site/app)",
                  style: TextStyle(color: themewhitecolor, fontSize: 14),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20),
                CustomTextField(
                  textInputType: TextInputType.text,
                  isOutlinedInputBorder: true,
                  padding: const EdgeInsets.all(18),
                  enabledBorderColor: themewhitecolor,
                  focusedBorderColor: Palette.themecolor,
                  borderWidth: 1.5,
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You can also find this in",
                      style: TextStyle(color: themewhitecolor, fontSize: 14),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RedemptionHistory(),
                          ),
                        );
                      },
                      child: Text(
                        "'My Redemptions' ",
                        style: TextStyle(
                          color: themewhitecolor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Text(
                      "tab.",
                      style: TextStyle(color: themewhitecolor, fontSize: 14),
                    ),
                    SizedBox(width: 5),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
