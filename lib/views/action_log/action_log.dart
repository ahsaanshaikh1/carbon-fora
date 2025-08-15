import 'dart:developer';

import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/action_log/end_action.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActiveDot extends StatelessWidget {
  final int activeIndex;
  const ActiveDot({Key? key, required this.activeIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return activeIndex == 3
        ? Container()
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            width: size.width / 100 * 28,
          );
  }
}

class InactiveDot extends StatelessWidget {
  final int inActiveIndex;
  const InactiveDot({Key? key, required this.inActiveIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return inActiveIndex == 3
        ? Container()
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(4),
            ),
            width: size.width / 100 * 28,
          );
  }
}

class LogActionScreen extends StatefulWidget {
  const LogActionScreen({super.key});

  @override
  State<LogActionScreen> createState() => _LogActionScreenState();
}

class _LogActionScreenState extends State<LogActionScreen> {
  final PageController _controller = PageController();
  int _currentStep = 0;
  int? selectedOption;
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  final Set<Marker> _markers = {};
  List materialsNam = [
    "Aluminum Cans",
    "Aluminum Ingot",
    "Steel Cans",
    "Copper Wire",
    "Glass",
    "HDPE (Plastic Type)",
    "PET (Plastic Type)",
    "PP (Plastic Type)",
    "Corrugated Containers",
  ];
  List materialsSavedEmission = [
    "CO₂e Saved: 0.06 tCO₂e",
    "CO₂e Saved: 0.04 tCO₂e",
    "CO₂e Saved: 0.32 tCO₂e",
    "CO₂e Saved: 0.18 tCO₂e",
    "CO₂e Saved: 0.05 tCO₂e",
    "CO₂e Saved: 0.21 tCO₂e",
    "CO₂e Saved: 0.23 tCO₂e",
    "CO₂e Saved: 0.20 tCO₂e",
    "CO₂e Saved: 0.11 tCO₂e",
  ];
  List materialsEarning = [
    "Value Earned: PKR 0.3672",
    "Value Earned: PKR 0.2448",
    "Value Earned: PKR 1.9584",
    "Value Earned: PKR 1.1016",
    "Value Earned: PKR 0.3060",
    "Value Earned: PKR 1.2852",
    "Value Earned: PKR 1.4076",
    "Value Earned: PKR 1.2240",
    "Value Earned: PKR 0.6732",
  ];
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location service is enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    // Request location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: const MarkerId("currentLocation"),
          position: _currentPosition!,
          infoWindow: const InfoWindow(title: "You are here"),
        ),
      );
    });

    // Move camera to current position
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(_currentPosition!, 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Palette.primaryColor),
        padding: EdgeInsets.all(12),
        child: CustomButton(
          buttoncolor: themewhitecolor,
          borderRadius: BorderRadius.circular(16),
          onTap: () {
            if (_currentStep == 0) {
              if (selectedOption == null) {
                showSnackBar(context, "Please select an option");
              } else {
                _controller.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              }
            } else if (_currentStep == 1) {
              _controller.animateToPage(
                2,
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastLinearToSlowEaseIn,
              );
            } else if (_currentStep == 2) {
              Go.route(context, EndAction());
            }
          },
          height: 60,
          child: Text(
            _currentStep == 2 ? "Sumbit Action" : "Next",
            style: TextStyle(
              color: Palette.primaryColor,
              fontSize: mediumfontsize2,
            ),
          ),
        ),
      ),
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
              // AppBar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Stack(
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
                        "Log Action",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (idx) {
                    return _currentStep >= idx
                        ? ActiveDot(activeIndex: (idx + 0))
                        : InactiveDot(inActiveIndex: (idx + 0));
                  }),
                ),
              ),

              const SizedBox(height: 16),
              Expanded(
                child: PageView(
                  onPageChanged: (int page) {
                    setState(() {
                      _currentStep = page;
                    });
                  },
                  controller: _controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [selectAction(), uploadProof(), addNotice()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectAction() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Your Action",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            20.kH,
            GridView.builder(
              itemCount: 4,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 60,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOption = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white38),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            10.kW,
                            Icon(
                              index == 0
                                  ? Icons.directions_bike
                                  : index == 1
                                  ? Icons.recycling
                                  : index == 2
                                  ? Icons.directions_walk
                                  : Icons.directions_transit,
                              color: Colors.white,
                              size: 28,
                            ),
                            6.kW,
                            Text(
                              index == 0
                                  ? "Bike"
                                  : index == 1
                                  ? "Recycle"
                                  : index == 2
                                  ? "Walk"
                                  : "Take Bus/Train",
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            selectedOption == index
                                ? Icon(Icons.check, color: themewhitecolor)
                                : 0.kH,
                            10.kW,
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            selectedOption == null ? 0.kH : 30.kH,
            selectedOption == null
                ? 0.kH
                : const Text(
                    "Estimated Impact",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
            selectedOption == null ? 0.kH : 20.kH,
            selectedOption == null
                ? 0.kH
                : selectedOption != 1
                ? Column(
                    children: List.generate(
                      2,
                      (indx) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: selectedOption == 0 || selectedOption == 2
                              ? Text(
                                  indx == 0
                                      ? "CO₂e Saved: 0.319511 kg"
                                      : "Value Earned: PKR 0.001955",
                                  style: const TextStyle(color: Colors.white),
                                )
                              : selectedOption == 3
                              ? Text(
                                  indx == 0
                                      ? "CO₂e Saved: 0.066007 kg"
                                      : "Value Earned: PKR 0.000403",
                                  style: const TextStyle(color: Colors.white),
                                )
                              : 0.kH,
                        ),
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: 9,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            materialsNam[index1],
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          10.kH,
                          Column(
                            children: List.generate(
                              2,
                              (indx) => Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5.0,
                                ),
                                child: Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: Colors.white12,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    indx == 0
                                        ? materialsSavedEmission[index1]
                                        : materialsEarning[index1],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          10.kH,
                        ],
                      );
                    },
                  ),
            25.kH,
            const Text(
              "Note: Based on average verified market rates. Actual value may vary.",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadProof() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.kH,
          const Text(
            "Upload Proof",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          20.kH,
          FilledBox(
            padding: const EdgeInsets.all(14),
            color: Colors.white12,
            borderRadius: BorderRadius.circular(12),
            child: Row(
              children: [
                Icon(Icons.camera_alt_outlined, color: Colors.white),
                10.kW,
                Text("Take a Picture", style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          20.kH,
          const Text(
            "Location & Time",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          20.kH,
          FilledBox(
            height: 200,
            width: double.infinity,
            color: Colors.white12,
            borderRadius: BorderRadius.circular(12),

            // image: const DecorationImage(
            //   image: AssetImage("assets/images/map.png"),
            //   fit: BoxFit.cover,
            // ),
            child: _currentPosition == null
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    onMapCreated: (controller) => _mapController = controller,
                    initialCameraPosition: CameraPosition(
                      target: _currentPosition!,
                      zoom: 16,
                    ),
                    markers: _markers,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
          ),
          30.kH,
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white24, width: 1),
            ),
            child: Row(
              children: [
                // Date
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Date",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Feb 16, 2025",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Vertical Divider
                Container(height: 40, width: 1, color: Colors.white30),

                // Time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Time",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "10:00 PM",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget addNotice() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Notes (Optional)",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white12,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const TextField(
              maxLines: 5,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration.collapsed(
                hintText: "Add a short description of the action",
                hintStyle: TextStyle(color: Colors.white54),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
