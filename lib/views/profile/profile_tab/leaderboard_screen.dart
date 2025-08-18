import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class LeaderboardScreen extends StatefulWidget {
  final bool isBackButtonVisible;
  const LeaderboardScreen({super.key, required this.isBackButtonVisible});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  int select = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
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
                    widget.isBackButtonVisible
                        ? Row(
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
                            ],
                          )
                        : SizedBox(),
                    const Center(
                      child: Text(
                        "Leaderboard",
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      children: [
                        FilledBox(
                          padding: EdgeInsets.all(10),
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(11),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              3,
                              (index) => Expanded(
                                child: FilledBox(
                                  onTap: () {
                                    setState(() {
                                      select = index;
                                    });
                                  },
                                  padding: const EdgeInsets.all(10),
                                  color: select == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(11),
                                  child: Center(
                                    child: Text(
                                      index == 0
                                          ? "Weekly"
                                          : index == 1
                                          ? "Monthly"
                                          : "All Time",
                                      style: TextStyle(
                                        color: select == index
                                            ? Color(0xFF0F6C9C)
                                            : Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: mediumfontsize3,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        20.kH,
                        // Ranking title row with info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Ranking",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(11),
                                border: Border.all(color: Colors.white30),
                              ),
                              child: Row(
                                children: const [
                                  Text(
                                    'Global',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.keyboard_arrow_down,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            // color: Colors.white10,s
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(color: Colors.white30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "#1 Username",
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Credits Earned",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.info_outline,
                                    size: 16,
                                    color: Colors.white70,
                                  ),
                                ],
                              ),
                              Text(
                                "CO₂e Saved",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Ranking Cards
                        _rankingTile(
                          "Huzaifa Arain",
                          "Gold",
                          152.4,
                          36.2,
                          context,
                        ),
                        _rankingTile(
                          "Huzaifa Arain",
                          "Silver",
                          152.4,
                          36.2,
                          context,
                        ),
                        _rankingTile(
                          "Huzaifa Arain",
                          "Bronze",
                          152.4,
                          36.2,
                          context,
                        ),

                        const SizedBox(height: 20),

                        // Your Rank
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Rank",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        _yourRankTile(
                          "Huzaifa Arain",
                          41.8,
                          9.3,
                          context,
                          size,
                        ),

                        const SizedBox(height: 10),
                        // Most Recycled
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              radius: 24,
                              backgroundColor: Colors.white,
                              child: Image.asset(
                                "assets/images/png/man.png",
                                width: 45,
                              ),
                            ),
                            title: const Text(
                              "Huzaifa Arain",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Row(
                                children: [
                                  Icon(Icons.recycling, color: themegreencolor),
                                  SizedBox(width: 3),
                                  Text(
                                    "Most Recycled",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
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

  Widget _rankingTile(
    String username,
    String medal,
    double credits,
    double co2,
    BuildContext context,
  ) {
    String medalLabel;

    switch (medal) {
      case "Gold":
        medalLabel = "🥇 Gold";
        break;
      case "Silver":
        medalLabel = "🥈 Silver";
        break;
      case "Bronze":
        medalLabel = "🥉 Bronze";
        break;
      default:
        medalLabel = "";
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Image.asset("assets/images/png/man.png", width: 45),
          ),
          const SizedBox(width: 12),

          // Username and Medal
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  medalLabel,
                  style: const TextStyle(color: Colors.white, fontSize: 13),
                ),
              ],
            ),
          ),

          // Credits with info
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  credits.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                10.kW,
                SuperTooltip(
                  showBarrier: true,
                  barrierColor: Colors.black.withOpacity(0.6),
                  sigmaX: 10,
                  sigmaY: 10,
                  content: FilledBox(
                    height: 150,
                    width: 400,
                    padding: EdgeInsets.all(8),
                    borderRadius: BorderRadius.circular(10),
                    color: themewhitecolor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Carbon Credits",
                              softWrap: true,
                              style: TextStyle(color: themeblackcolor),
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
                    size: 18,
                  ),
                ),
              ],
            ),
          ),

          // CO₂ Saved
          Expanded(
            flex: 3,
            child: Text(
              "${co2.toStringAsFixed(1)} kg",
              textAlign: TextAlign.end,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _yourRankTile(
    String username,
    double credits,
    double co2,
    BuildContext context,
    size,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Top Row: Avatar + Info
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar
              CircleAvatar(
                radius: 24,
                backgroundColor: Colors.white,
                child: Image.asset("assets/images/png/man.png", width: 45),
              ),
              const SizedBox(width: 12),

              // Username
              Expanded(
                flex: 4,
                child: Text(
                  username,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),

              // Credits with info
              Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      credits.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    10.kW,
                    SuperTooltip(
                      showBarrier: true,
                      barrierColor: Colors.black.withOpacity(0.6),
                      sigmaX: 10,
                      sigmaY: 10,
                      content: FilledBox(
                        height: 150,
                        width: size.width / 100 * 80,
                        padding: EdgeInsets.all(8),
                        borderRadius: BorderRadius.circular(10),
                        color: themewhitecolor,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "Carbon Credits",
                                  softWrap: true,
                                  style: TextStyle(color: themeblackcolor),
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
                                fontSize: smallfontsize1,
                                color: themegreytextcolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      child: Icon(Icons.info_outline, color: Colors.white),
                    ),
                  ],
                ),
              ),

              // CO₂ Saved
              Expanded(
                flex: 3,
                child: Text(
                  "${co2.toStringAsFixed(1)} kg",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          // Action Buttons Row
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                SizedBox(width: 30),
                Expanded(child: _actionButton("Challenge a Friend")),
                const SizedBox(width: 8),
                Expanded(child: _actionButton("Share My Score")),
                const SizedBox(width: 8),
                Expanded(child: _actionButton("Boost My Rank")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionButton(String label) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(11),
          border: Border.all(color: Colors.white30),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
