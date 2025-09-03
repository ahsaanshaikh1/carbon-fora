import 'package:carbon_fora/model/action_log_m.dart';
import 'package:carbon_fora/provider/action_log/action_log_pro.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:super_tooltip/super_tooltip.dart';

class LogHistory extends StatefulWidget {
  const LogHistory({super.key});

  @override
  State<LogHistory> createState() => _LogHistoryState();
}

class _LogHistoryState extends State<LogHistory> {
  // String? selectDays = 'PENDING';
  List<String> daysList = ["Pending", "Rejected", "Verified", "All"];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      Provider.of<ActionLogPro>(
        context,
        listen: false,
      ).getLogs(context: context, fresh: true);
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Provider.of<ActionLogPro>(
          context,
          listen: false,
        ).getLogs(context: context, fresh: false);
      }
    });
    super.initState();
  }

  final ScrollController scrollController = ScrollController();

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
                    SizedBox(
                      height: 40,
                      width: 90,
                      child: DropdownButtonFormField(
                        hint: Text(
                          "All",
                          maxLines: 1,

                          style: TextStyle(
                            fontSize: 10,
                            color: themewhitecolor,
                          ),
                        ),
                        iconDisabledColor: themewhitecolor,
                        iconEnabledColor: themewhitecolor,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white, // White border
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Colors.white, // White border on focus
                              width: 1.5,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          contentPadding: const EdgeInsets.all(8),
                        ),
                        value: Provider.of<ActionLogPro>(
                          context,
                          listen: false,
                        ).status,
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
                        onChanged: (item) {
                          Provider.of<ActionLogPro>(
                            context,
                            listen: false,
                          ).status = item!;
                          Provider.of<ActionLogPro>(
                            context,
                            listen: false,
                          ).getLogs(context: context, fresh: true);
                        },
                      ),
                    ),
                  ],
                ),
                20.kH,
                Consumer<ActionLogPro>(
                  builder: (context, pro, child) {
                    return Expanded(
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          children: [
                            ListView.builder(
                              itemCount: pro.logs.length,
                              shrinkWrap: true,
                              primary: false,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: LogCard(log: pro.logs[index]),
                                );
                              },
                            ),
                            pro.isLoading
                                ? Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: themewhitecolor,
                                      ),
                                    ),
                                  )
                                : 0.kH,
                          ],
                        ),
                      ),
                    );
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
  final String reason;
  final IconData? icon;

  LogItem(
    this.title,
    this.credits,
    this.status,
    this.time,
    this.reason, [
    this.icon,
  ]);
}

class LogCard extends StatelessWidget {
  final ActionLog log;

  LogCard({required this.log});
  final _controller = SuperTooltipController();

  void showReasonDialog() {
    SuperTooltip(
      controller: _controller,
      showBarrier: true,
      barrierColor: Colors.black.withOpacity(0.6),
      sigmaX: 10,
      sigmaY: 10,
      content: FilledBox(
        height: 150,
        width: 350,
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
      child: FilledBox(
        padding: const EdgeInsets.all(16),
        color: Colors.white.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: themewhitecolor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white.withOpacity(0.15),
                  child: Icon(Icons.eco, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        log.actionType.replaceAll("_", " "),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "+${log.carbonCreditsEarned.toStringAsFixed(6)}",
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          // Icon(Icons.info_outline, size: 16, color: Colors.white54),
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
                        color: Colors.transparent.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color: themewhitecolor),
                      ),
                      child: Text(
                        log.verificationStatus,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      DateFormat(
                        "d MMM, y",
                      ).format(DateTime.parse(log.timestamp.toString())),

                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            log.verificationStatus == "REJECTED" ? 5.kH : 0.kW,
            log.verificationStatus == "REJECTED"
                ? Text(
                    log.reason,
                    style: TextStyle(fontSize: 12, color: Colors.white70),
                  )
                : 0.kW,
          ],
        ),
      ),
    );
  }
}
