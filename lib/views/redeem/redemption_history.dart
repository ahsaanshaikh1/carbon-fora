import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/material.dart';

class RedemptionHistory extends StatefulWidget {
  const RedemptionHistory({super.key});

  @override
  State<RedemptionHistory> createState() => _RedemptionHistoryState();
}

class _RedemptionHistoryState extends State<RedemptionHistory> {
  int selectIndex = 0;
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
                const SizedBox(height: 20),
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
                            padding: const EdgeInsets.only(
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
                        "Redemptions History",
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
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                      width: 1,
                      color: Colors.white.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: List.generate(
                      3,
                      (index) => Expanded(
                        child: FilledBox(
                          onTap: () {
                            setState(() {
                              selectIndex = index;
                            });
                          },
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          color: selectIndex == index
                              ? Colors.white
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(11),
                          child: Center(
                            child: Text(
                              index == 0
                                  ? "Active"
                                  : index == 1
                                  ? "Used"
                                  : "Expired",
                              style: TextStyle(
                                color: selectIndex == index
                                    ? Color(0xFF0F6C9C)
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                30.kH,
                GridView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  primary: false,
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 240,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (context, index) {
                    return _voucherCard(
                      index == 0
                          ? 'Travel Voucher'
                          : index == 1
                          ? "Fashion"
                          : "Travel Voucher",
                      index == 0
                          ? 'assets/images/png/travel.png'
                          : index == 1
                          ? "assets/images/png/brand.png"
                          : "assets/images/png/travel.png",
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

  Widget _voucherCard(String title, String imagePath) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Active',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 119, 255),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CircleAvatar(backgroundImage: AssetImage(imagePath), radius: 30),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('XXXX-XXXX', style: TextStyle(color: Colors.white70)),
              SizedBox(width: 6),
              Icon(Icons.copy, size: 16, color: Colors.white70),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'View Details',
              style: TextStyle(color: Color.fromARGB(255, 0, 119, 255)),
            ),
          ),
        ],
      ),
    );
  }
}
