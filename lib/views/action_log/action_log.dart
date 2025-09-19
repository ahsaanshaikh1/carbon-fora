import 'dart:developer';
import 'dart:io';

import 'package:carbon_fora/provider/action_log/action_log_pro.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/utils/helper/validator.dart';
import 'package:carbon_fora/views/action_log/action_submitted.dart';
import 'package:carbon_fora/views/action_log/end_action.dart';
import 'package:exif/exif.dart';
import 'package:carbon_fora/widgets/custom_button.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
  String? selectedValue;
  final fKey = GlobalKey<FormState>();
  final List<String> options = [
    "Aluminum Cans",
    "Aluminum Ingot",
    "Steel Cans",
    "Copper Wire",
    "Glass",
    "HDPE",
    "PET",
    "PP",
    "Corrugated Containers",
  ];
  String? selectedValue1;

  final List<String> options1 = [
    "Wool",
    "Acrylic",
    "Viscose",
    "Cotton",
    "Silk",
    "Polyester",
    "Polyurethane",
    "Flax linen",
  ];
  GoogleMapController? _mapController;
  LatLng? _currentPosition;
  final Set<Marker> _markers = {};
  DateTime date = DateTime.now();
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
    "CO₂e Saved: 0.06",
    "CO₂e Saved: 0.04",
    "CO₂e Saved: 0.32",
    "CO₂e Saved: 0.18",
    "CO₂e Saved: 0.05",
    "CO₂e Saved: 0.21",
    "CO₂e Saved: 0.23",
    "CO₂e Saved: 0.20",
    "CO₂e Saved: 0.11",
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
  List secHandNam = [
    "Wool",
    "Acrylic",
    "Viscose",
    "Cotton",
    "Silk",
    "Polyester",
    "Polyurethane",
    "Flax linen",
  ];
  List secHandSavedEmission = [
    "CO₂e Saved: 46 kg",
    "CO₂e Saved: 38 kg",
    "CO₂e Saved: 30 kg",
    "CO₂e Saved: 28 kg",
    "CO₂e Saved: 25 kg",
    "CO₂e Saved: 21 kg",
    "CO₂e Saved: 20 kg",
    "CO₂e Saved: 15 kg",
  ];
  List secHandEarning = [
    "Value Earned: PKR 0.282",
    "Value Earned: PKR 0.233",
    "Value Earned: PKR 0.184",
    "Value Earned: PKR 0.171",
    "Value Earned: PKR 0.153",
    "Value Earned: PKR 0.129",
    "Value Earned: PKR 0.122",
    "Value Earned: PKR 0.092",
  ];
  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  XFile? image;
  final ctrl = TextEditingController();
  final fieldCtrl = TextEditingController();
  Future<void> _getCurrentLocation() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;

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

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_currentPosition!, 16),
      );
    } catch (e) {
      showSnackBar(context, "Error occured while fetching location.");
    }
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
              if (image == null) {
                showSnackBar(context, "Please take picture first");
              } else {
                _controller.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn,
                );
              }
            } else if (_currentStep == 2) {
              if (fKey.currentState!.validate()) {
                if (selectedOption == 1 ||
                    selectedOption == 4 ||
                    selectedOption == 5 ||
                    selectedOption == 6 ||
                    selectedOption == 7) {
                  // Go.route(context, ActionSubmitted());
                  if (selectedOption == 1) {
                    Provider.of<ActionLogPro>(
                      context,
                      listen: false,
                    ).logRecycleAction(
                      context: context,
                      image: File(image!.path),
                      weight: double.parse(fieldCtrl.text),
                      description: ctrl.text,
                      material: selectedValue!,
                    );
                  } else if (selectedOption == 4) {
                    Provider.of<ActionLogPro>(
                      context,
                      listen: false,
                    ).logSecondhandAction(
                      context: context,
                      image: File(image!.path),
                      weight: double.parse(fieldCtrl.text),
                      description: ctrl.text,
                      fabric: selectedValue1!,
                    );
                  } else if (selectedOption == 5) {
                    Provider.of<ActionLogPro>(
                      context,
                      listen: false,
                    ).logTreePlantAction(
                      context: context,
                      image: File(image!.path),
                      trees: int.parse(fieldCtrl.text),
                      description: ctrl.text,
                    );
                  } else if (selectedOption == 6) {
                    Provider.of<ActionLogPro>(
                      context,
                      listen: false,
                    ).logWaterBottlesAction(
                      context: context,
                      image: File(image!.path),
                      bottles: int.parse(fieldCtrl.text),
                      description: ctrl.text,
                    );
                  } else if (selectedOption == 7) {
                    Provider.of<ActionLogPro>(
                      context,
                      listen: false,
                    ).logPlantBasedMealAction(
                      context: context,
                      image: File(image!.path),
                      weight: double.parse(fieldCtrl.text),
                      description: ctrl.text,
                    );
                  }
                } else {
                  Go.route(
                    context,
                    EndAction(
                      description: ctrl.text,
                      selectedOption: selectedOption!,
                      photo: File(image?.path ?? ""),
                    ),
                  );
                }
              }
            }
          },
          height: 60,
          child: Text(
            _currentStep == 2 ? "Submit Action" : "Next",
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
              itemCount: 8,
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
                        Expanded(
                          child: Row(
                            children: [
                              10.kW,
                              Icon(
                                index == 0
                                    ? Icons.directions_bike
                                    : index == 1
                                    ? Icons.recycling
                                    : index == 2
                                    ? Icons.directions_walk
                                    : index == 3
                                    ? Icons.directions_transit
                                    : index == 4
                                    ? Icons.change_circle
                                    : index == 5
                                    ? Icons.eco
                                    : index == 6
                                    ? Icons.water_drop
                                    : Icons.local_dining,
                                color: Colors.white,
                                size: 28,
                              ),
                              6.kW,
                              Expanded(
                                child: Text(
                                  index == 0
                                      ? "Bike"
                                      : index == 1
                                      ? "Recycle"
                                      : index == 2
                                      ? "Walk"
                                      : index == 3
                                      ? "Take Bus/Train"
                                      : index == 4
                                      ? "Buying Secondhand"
                                      : index == 5
                                      ? "Tree Plantation"
                                      : index == 6
                                      ? "Refill Water Bottles"
                                      : "Plant Based Meal",
                                  maxLines: 1,
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
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
                : selectedOption != 1 && selectedOption != 4
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
                              : selectedOption == 5
                              ? Text(
                                  indx == 0
                                      ? "CO₂e Saved: 10 kg"
                                      : "Value Earned: PKR 0.0612",
                                  style: const TextStyle(color: Colors.white),
                                )
                              : selectedOption == 6
                              ? Text(
                                  indx == 0
                                      ? "CO₂e Saved: 1.2 kg"
                                      : "Value Earned: PKR 0.007344",
                                  style: const TextStyle(color: Colors.white),
                                )
                              : selectedOption == 7
                              ? Text(
                                  indx == 0
                                      ? "CO₂e Saved: 31.34 kg"
                                      : "Value Earned: PKR 0.1918008",
                                  style: const TextStyle(color: Colors.white),
                                )
                              : 0.kH,
                        ),
                      ),
                    ),
                  )
                : selectedOption == 4
                ? ListView.builder(
                    itemCount: 8,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index1) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            secHandNam[index1],
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
                                        ? secHandSavedEmission[index1]
                                        : secHandEarning[index1],
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
    date = DateTime.now();
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
            onTap: () async {
              ImagePicker picker = ImagePicker();
              image = await picker.pickImage(source: ImageSource.camera);
              if (image != null) {
                final bytes = await File(image!.path).readAsBytes();
                final tags = await readExifFromBytes(bytes);
                log(tags.toString());
              }
              setState(() {});
            },
            padding: const EdgeInsets.all(14),
            color: Colors.white12,
            borderRadius: BorderRadius.circular(12),
            child: Row(
              children: [
                Icon(Icons.camera_alt_outlined, color: Colors.white),
                10.kW,
                Text(
                  image == null ? "Take a Picture" : "Image captured",
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showProofUploadPopup(context);
                  },
                  child: Icon(Icons.info_outlined, color: Colors.white),
                ),
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
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(12),

            // image: const DecorationImage(
            //   image: AssetImage("assets/images/map.png"),
            //   fit: BoxFit.cover,
            // ),
            child: _currentPosition == null
                ? const Center(child: CircularProgressIndicator())
                : ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: GoogleMap(
                      onMapCreated: (controller) => _mapController = controller,
                      initialCameraPosition: CameraPosition(
                        target: _currentPosition!,
                        zoom: 16,
                      ),
                      markers: _markers,
                      zoomControlsEnabled: false,

                      // myLocationEnabled: true,
                      // myLocationButtonEnabled: true,76
                    ),
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
                        DateFormat("MMM d, yyyy").format(date),
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
                        DateFormat("hh:mm a").format(date),
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
      child: Form(
        key: fKey,
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
              child: TextField(
                maxLines: 5,
                controller: ctrl,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration.collapsed(
                  hintText: "Add a short description of the action",
                  hintStyle: TextStyle(color: Colors.white54),
                ),
              ),
            ),
            selectedOption == 6 ||
                    selectedOption == 7 ||
                    selectedOption == 1 ||
                    selectedOption == 4 ||
                    selectedOption == 5
                ? const SizedBox(height: 12)
                : 0.kH,
            selectedOption == 6 ||
                    selectedOption == 7 ||
                    selectedOption == 1 ||
                    selectedOption == 4 ||
                    selectedOption == 5
                ? Text(
                    selectedOption == 6
                        ? "Number of Bottles"
                        : selectedOption == 7
                        ? "Weight"
                        : selectedOption == 1
                        ? "Mass"
                        : selectedOption == 4
                        ? "Weight"
                        : selectedOption == 5
                        ? "Number of Trees"
                        : "",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                : 0.kH,
            selectedOption == 6 ||
                    selectedOption == 7 ||
                    selectedOption == 1 ||
                    selectedOption == 4 ||
                    selectedOption == 5
                ? const SizedBox(height: 12)
                : 0.kH,
            selectedOption == 6
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      maxLines: 2,
                      controller: fieldCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a number";
                        }
                        final regex = RegExp(r'^[1-9][0-9]*$');
                        if (!regex.hasMatch(value)) {
                          return "Enter a positive integer without leading zeros";
                        }
                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration.collapsed(
                        hintText:
                            "Number of 500ml plastic bottles avoided by refilling",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  )
                : selectedOption == 7
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      maxLines: 2,
                      controller: fieldCtrl,
                      style: TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a number";
                        }

                        final regex = RegExp(r'^(?!0+(\.0+)?$)(\d+(\.\d+)?)$');

                        if (!regex.hasMatch(value)) {
                          return "Enter a valid positive number";
                        }

                        return null;
                      },
                      decoration: InputDecoration.collapsed(
                        hintText: "Weight of the plant-based meal in kilograms",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  )
                : selectedOption == 1
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      maxLines: 2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a number";
                        }

                        // Regex: matches positive doubles (no negatives, no zero)
                        final regex = RegExp(r'^(?!0+(\.0+)?$)(\d+(\.\d+)?)$');

                        if (!regex.hasMatch(value)) {
                          return "Enter a valid positive number";
                        }

                        return null;
                      },
                      controller: fieldCtrl,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration.collapsed(
                        hintText: "Mass of the recycled material in short tons",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  )
                : selectedOption == 4
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      maxLines: 2,
                      controller: fieldCtrl,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a number";
                        }

                        // Regex: matches positive doubles (no negatives, no zero)
                        final regex = RegExp(r'^(?!0+(\.0+)?$)(\d+(\.\d+)?)$');

                        if (!regex.hasMatch(value)) {
                          return "Enter a valid positive number";
                        }

                        return null;
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration.collapsed(
                        hintText: "Weight of the secondhand item in kilograms",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  )
                : selectedOption == 5
                ? Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      maxLines: 2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a number";
                        }
                        final regex = RegExp(r'^[1-9][0-9]*$');
                        if (!regex.hasMatch(value)) {
                          return "Enter a positive integer without leading zeros";
                        }
                        return null;
                      },
                      controller: fieldCtrl,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration.collapsed(
                        hintText: "Number of trees planted",
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  )
                : 0.kH,
            selectedOption == 1 || selectedOption == 4 ? 12.kH : 0.kH,
            selectedOption == 1 || selectedOption == 4
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedOption == 1
                            ? "Material"
                            : selectedOption == 4
                            ? "Fabric"
                            : "",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      12.kH,
                      selectedOption == 1
                          ? Container(
                              height: 70,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color:
                                    Colors.white12, // background like in image
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButtonFormField<String>(
                                value: selectedValue,
                                validator: ValidatorHelper.validator,
                                decoration: InputDecoration.collapsed(
                                  hintText: '',
                                ), // remove border
                                hint: Text(
                                  "Type of material recycled.",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    // fontSize: 17.5,
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                                dropdownColor: Palette.primaryColor,
                                style: TextStyle(color: Colors.white),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                items: options.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValue = newValue;
                                  });
                                },
                              ),
                            )
                          : Container(
                              height: 70,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color:
                                    Colors.white12, // background like in image
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: DropdownButtonFormField<String>(
                                validator: ValidatorHelper.validator,

                                value: selectedValue1,
                                decoration: InputDecoration.collapsed(
                                  hintText: '',
                                ), // remove border
                                hint: Text(
                                  "Type of fabric.",
                                  style: TextStyle(
                                    color: Colors.white54,
                                    // fontSize: 17.5,
                                    // fontWeight: FontWeight.w600,
                                  ),
                                ),
                                dropdownColor: Palette.primaryColor,
                                style: TextStyle(color: Colors.white),
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.white,
                                ),
                                items: options1.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValue1 = newValue;
                                  });
                                },
                              ),
                            ),
                    ],
                  )
                : 0.kH,
          ],
        ),
      ),
    );
  }
}

void showProofUploadPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          "Image Properties for Proof Uploads",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "📷 Image Properties:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text("• Minimum Resolution: 800 × 600 pixels"),
                Text("• Recommended Resolution: 1280 × 720 pixels"),
                Text("• Maximum File Size: 5 MB"),
                Text("• Accepted Formats: JPEG (.jpg), PNG (.png)"),
                Text("• Orientation: Portrait or Landscape"),
                Text("• Clarity: Main object must cover at least 40% of frame"),
                SizedBox(height: 15),

                Text(
                  "✅ Activities List:",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  "• Bike → Central object (40%+ of frame), with background (street/parking/workplace).",
                ),
                Text(
                  "• Recycle → Recycling bin logo + recyclables must be clear (not mixed with waste).",
                ),
                Text(
                  "• Walk → If selfie, outdoor background must be identifiable.",
                ),
                Text(
                  "• Take Bus/Train → Interior or ticket with readable date/text required.",
                ),
                Text(
                  "• Buying Secondhand → Photo of item OR receipt with date, store name & item details.",
                ),
                Text(
                  "• Tree Plantation → Sapling + soil + person visible, sapling at least 30%.",
                ),
                Text(
                  "• Refill Water Bottle → Reusable bottle + refill source visible (no single-use bottles).",
                ),
                Text(
                  "• Plant-Based Meal → Meal clear & 40%+ of frame; optional menu photo for ingredients.",
                ),
              ],
            ),
          ),
        ),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      );
    },
  );
}
