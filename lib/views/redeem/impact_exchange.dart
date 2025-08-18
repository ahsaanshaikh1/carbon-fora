import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/redeem/voucher_detail.dart';
import 'package:flutter/material.dart';

class ImpactExchange extends StatefulWidget {
  final bool isBackButtonVisible;
  const ImpactExchange({super.key, required this.isBackButtonVisible});

  @override
  State<ImpactExchange> createState() => _ImpactExchangeState();
}

class _ImpactExchangeState extends State<ImpactExchange> {
  String selectedChip = "All"; // Default selected chip

  @override
  Widget build(BuildContext context) {
    final chips = ["All", "Fashion", "Personal Care", "Travel"];
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1D8AA2), Color(0xFF4834AA)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              10.kH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Row(
                      children: [
                        widget.isBackButtonVisible
                            ? InkWell(
                                onTap: () {
                                  // Navigator.pop(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white24,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Color.fromARGB(252, 149, 215, 231),
                                  ),
                                ),
                              )
                            : SizedBox(),
                      ],
                    ),
                    const Center(
                      child: Text(
                        "Impact & Exchange",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.kH,
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            children: chips
                                .map(
                                  (chip) => Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: _buildChip(
                                      chip,
                                      isSelected: selectedChip == chip,
                                      onTap: () {
                                        setState(() {
                                          selectedChip =
                                              chip; // Update selected chip
                                        });
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      20.kH,
                      // GridView placed correctly
                      GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          mainAxisExtent: 290,
                        ),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const BadgeCard(
                            image: "assets/images/png/travel.png",
                            title: "Travel Voucher",
                            description: 'Worth up to \$5\n50 Credits',
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChip(
    String label, {
    bool isSelected = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.transparent,
          border: Border.all(color: Colors.white30),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.blue.shade800 : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}

class BadgeCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const BadgeCard({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white70),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: themewhitecolor,
            backgroundImage: AssetImage(image),
          ),
          10.kH,
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          4.kH,
          Text(
            description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          10.kH,
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue.shade800,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(11),
              ),
              padding: EdgeInsets.symmetric(horizontal: 30),
            ),
            onPressed: () {
              Go.route(context, VoucherDetail());
            },
            child: Text(
              'Redeem Now',
              style: TextStyle(
                color: Palette.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          8.kH,
          Text(
            "Vouchers are fulfilled instantly via email/SMS. No delivery required.",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 9.5,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
