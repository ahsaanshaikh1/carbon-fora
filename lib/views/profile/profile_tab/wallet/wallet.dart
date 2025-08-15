import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/action_log/log_history.dart';
import 'package:carbon_fora/views/profile/profile_tab/wallet/widgets/filter_chips.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});
  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  final List<LogItem> logs = [
    LogItem("Bike", "+1.2 Carbon Credits", "Pending", "Today, 9:30 AM"),
    LogItem("Recycle", "+0.6 Carbon Credits", "Verified", "Today, 9:30 AM"),
    LogItem(
      "Recycle",
      "+0.6 Carbon Credits",
      "Rejected",
      "Today, 9:30 AM",
      Icons.info_outline,
    ),
  ];
  int isSelected = 0;
  String? selectDays = 'All';
  List<String> daysList = ["All", "Weekly"];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              10.kH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 6,
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
                    Text(
                      "Wallet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Image(
                      image: AssetImage("assets/images/png/share.png"),
                      width: 30,
                      height: 30,
                    ),
                  ],
                ),
              ),
              20.kH,
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        FilledBox(
                          color: themewhitecolor.withAlpha(20),
                          padding: EdgeInsets.all(12),
                          border: Border.all(width: .2, color: themewhitecolor),
                          borderRadius: BorderRadius.circular(11),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Your Carbon Wallet ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SuperTooltip(
                                    showBarrier: true,
                                    showDropBoxFilter: true,
                                    sigmaX: 10,
                                    sigmaY: 10,
                                    content: FilledBox(
                                      height: 150,
                                      width: size.width / 100 * 80,
                                      padding: EdgeInsets.all(10),
                                      borderRadius: BorderRadius.circular(10),
                                      color: themewhitecolor,
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Text(
                                                "Earned Dollar",
                                                softWrap: true,
                                                style: TextStyle(
                                                  color: themeblackcolor,
                                                ),
                                              ),
                                              ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return const LinearGradient(
                                                    colors: [
                                                      Color(0xFF4834AA),
                                                      Color(0xFF1D8AA2),
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ).createShader(bounds);
                                                },
                                                blendMode: BlendMode.srcIn,
                                                child: Image.asset(
                                                  "assets/images/png/dollar.png",
                                                  width: 35,
                                                  height: 35,
                                                ),
                                              ),
                                            ],
                                          ),
                                          10.kH,
                                          Text(
                                            "Estimated value based on average carbon credit prices in the voluntary market. Actual redemption value may vary based on partner offers and market rates.",
                                            style: TextStyle(
                                              fontSize: smallfontsize1,
                                              color: themegreytextcolor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    child: Icon(
                                      Icons.info_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '\$1.47 USD Impact Value',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        25.kH,
                        GridView.builder(
                          itemCount: 2,
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 120,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                              ),
                          itemBuilder: (context, index) {
                            return FilledBox(
                              padding: EdgeInsets.all(12),
                              color: themewhitecolor.withAlpha(20),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: themewhitecolor.withAlpha(100),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.asset(
                                        index == 0
                                            ? "assets/images/png/plant.png"
                                            : "assets/images/png/co2.png",
                                        width: 50,
                                      ),
                                      Text(
                                        index == 0 ? "12.6 kg" : "3.1 kg\nCO2e",
                                        style: TextStyle(
                                          fontSize: smallfontsize1,
                                          color: themewhitecolor,
                                          fontWeight: boldfontweight,
                                        ),
                                      ),
                                    ],
                                  ),
                                  25.kH,
                                  Row(
                                    children: [
                                      Text(
                                        index == 0
                                            ? "Carbon Credit"
                                            : "Total CO₂ Saved",
                                        style: TextStyle(
                                          fontSize: mediumfontsize5,
                                          color: themewhitecolor,
                                          fontWeight: boldfontweight,
                                        ),
                                      ),
                                      15.kW,
                                      index == 0
                                          ? SuperTooltip(
                                              showBarrier: true,
                                              showDropBoxFilter: true,
                                              sigmaX: 10,
                                              sigmaY: 10,
                                              content: FilledBox(
                                                height: 150,
                                                width: size.width / 100 * 80,
                                                padding: EdgeInsets.all(8),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: themewhitecolor,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          "Carbon Credits",
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            color:
                                                                themeblackcolor,
                                                          ),
                                                        ),
                                                        Image.asset(
                                                          "assets/images/png/plant-clr.png",
                                                          width: 50,
                                                        ),
                                                      ],
                                                    ),
                                                    10.kH,
                                                    Text(
                                                      "Credits earned are calculated based on verified micro-actions and validated using timestamps, GPS, and image proof. Final acceptance depends on verification protocols.",
                                                      style: TextStyle(
                                                        fontSize:
                                                            smallfontsize1,
                                                        color:
                                                            themegreytextcolor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.info_outline,
                                                color: Colors.white,
                                              ),
                                            )
                                          : SuperTooltip(
                                              showBarrier: true,
                                              showDropBoxFilter: true,
                                              sigmaX: 10,
                                              sigmaY: 10,
                                              content: FilledBox(
                                                height: 150,
                                                width: size.width / 100 * 80,
                                                padding: EdgeInsets.all(10),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: themewhitecolor,
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          "Total CO2 Saved",
                                                          softWrap: true,
                                                          style: TextStyle(
                                                            color:
                                                                themeblackcolor,
                                                          ),
                                                        ),
                                                        Image.asset(
                                                          "assets/images/png/co2-clr.png",
                                                          width: 50,
                                                        ),
                                                      ],
                                                    ),
                                                    10.kH,
                                                    Text(
                                                      "Total emissions reduced through your verified actions since signup. Calculated using emission factors aligned with IPCC guidelines.",
                                                      style: TextStyle(
                                                        fontSize:
                                                            smallfontsize1,
                                                        color:
                                                            themegreytextcolor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              child: Icon(
                                                Icons.info_outline,
                                                color: Colors.white,
                                              ),
                                            ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            const Text(
                              'Recent Activity',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            FilledBox(
                              padding: EdgeInsets.zero,
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(12),
                              child: Row(
                                children: List.generate(
                                  2,
                                  (index) => FilledBox(
                                    onTap: () {
                                      setState(() {
                                        isSelected = index;
                                      });
                                    },
                                    width: 85,
                                    color: isSelected == index
                                        ? Colors.white
                                        : Colors.transparent,
                                    borderRadius: isSelected == 0
                                        ? BorderRadius.only(
                                            topLeft: Radius.circular(12),
                                            bottomLeft: Radius.circular(12),
                                          )
                                        : BorderRadius.only(
                                            topRight: Radius.circular(12),
                                            bottomRight: Radius.circular(12),
                                          ),
                                    padding: EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        index == 0 ? "This Month" : "All Time",
                                        style: TextStyle(
                                          color: isSelected == index
                                              ? Color(0xFF1D8AA2)
                                              : Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: smallfontsize3,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            10.kW,
                            SizedBox(
                              height: 40,
                              width: 100,
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.white, // White border
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color:
                                          Colors.white, // White border on focus
                                      width: 1.5,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(8),
                                ),
                                value: selectDays,
                                dropdownColor: Palette.primaryColor,
                                menuMaxHeight: 200,
                                isDense: true,
                                items: daysList
                                    .map(
                                      (item) => DropdownMenuItem(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: themewhitecolor,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (item) =>
                                    setState(() => daysList != item),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: logs.length,
                          itemBuilder: (context, index) {
                            return LogCard(log: logs[index]);
                          },
                        ),
                        const SizedBox(height: 12),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: _bottomButton(
                            "Redeem for Rewards",
                            () async {},
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: const Center(
                                child: Text(
                                  'Conversion rate: 1 credit ≈ \$0.12 USD\nLast updated: 21/05/2025',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomButton(String text, VoidCallback onTap) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xfe402BB5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(21)),
        minimumSize: const Size(double.infinity, 58),
      ),
      onPressed: onTap,
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
