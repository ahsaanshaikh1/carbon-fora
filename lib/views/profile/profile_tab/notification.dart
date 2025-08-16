import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
              _buildHeader(context),
              SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildNotificationCard(
                        image: "assets/images/png/plant.png",
                        title: 'Mission Complete!',
                        message:
                            'You earned 12 credits for biking to work today. Great job reducing CO₂!',
                        timeAgo: '2 days ago',
                      ),
                      _buildNotificationCard(
                        image: "assets/images/png/gift.png",
                        title: 'New Reward Unlocked!',
                        message:
                            'Redeem your "Eco Grocery Voucher" worth Rs. 500 using your saved credits.',
                        timeAgo: '2 days ago',
                      ),
                      _buildNotificationCard(
                        image: "assets/images/png/fire.png",
                        title: 'Streak Active!',
                        message:
                            'You’ve reduced emissions 5 days in a row. Keep the green streak alive!',
                        timeAgo: '3 days ago',
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
                "Notification",
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

  Widget _buildNotificationCard({
    required String image,
    required String title,
    required String message,
    required String timeAgo,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, height: 28, width: 28),
          const SizedBox(width: 12),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 80,
                  ), // Leave space for time
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Text(
                    timeAgo,
                    style: const TextStyle(fontSize: 12, color: Colors.white54),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
