import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class LogHistory extends StatefulWidget {
  const LogHistory({super.key});

  @override
  State<LogHistory> createState() => _LogHistoryState();
}

class _LogHistoryState extends State<LogHistory> {
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

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: FilledBox(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 10,
                        ),
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Color.fromARGB(252, 149, 215, 231),
                        ),
                      ),
                    ),
                    Text(
                      "Action Submitted",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                20.kH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "All Logs",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text("All", style: TextStyle(color: Colors.white)),
                          Icon(Icons.arrow_drop_down, color: Colors.white),
                        ],
                      ),
                    ),
                  ],
                ),
                20.kH,
                ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return LogCard(log: logs[index]);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LogItem {
  final String title;
  final String credits;
  final String status;
  final String time;
  final IconData? icon;

  LogItem(this.title, this.credits, this.status, this.time, [this.icon]);
}

class LogCard extends StatelessWidget {
  final LogItem log;

  LogCard({required this.log});
  final _controller = SuperTooltipController();

  Color getStatusColor(String status) {
    switch (status) {
      case "Pending":
        return Colors.transparent;
      case "Verified":
        return Colors.transparent;
      case "Rejected":
        return Colors.transparent;
      default:
        return Colors.transparent;
    }
  }

  IconData getIcon(String title) {
    if (title == "Bike") return Icons.pedal_bike;
    return Icons.recycling;
  }

  void showReasonDialog() {
    SuperTooltip(
      controller: _controller,
      showBarrier: true,
      showDropBoxFilter: true,
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
            const Text(
              "Why Rejected ?",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            10.kH,
            const Text("This redemption was rejected due to expired offer."),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _controller.showTooltip();
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(width: 1, color: themewhitecolor),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: Colors.white.withOpacity(0.15),
              child: Icon(getIcon(log.title), color: Colors.white),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    log.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        log.credits,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      if (log.icon != null) ...[
                        const SizedBox(width: 6),
                        Icon(log.icon, size: 16, color: Colors.white54),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusColor(log.status).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: themewhitecolor),
                  ),
                  child: Text(
                    log.status,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  log.time,
                  style: const TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
