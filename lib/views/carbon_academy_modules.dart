import 'package:carbon_fora/provider/carbon_academy/carbon_academy_pro.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/profile/profile_tab/carbon_academy.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarbonAcademyModules extends StatefulWidget {
  const CarbonAcademyModules({super.key});

  @override
  State<CarbonAcademyModules> createState() => _CarbonAcademyModulesState();
}

class _CarbonAcademyModulesState extends State<CarbonAcademyModules> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((val) {
      Provider.of<CarbonAcademyPro>(
        context,
        listen: false,
      ).getModules(context: context, fresh: true);
    });
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        Provider.of<CarbonAcademyPro>(
          context,
          listen: false,
        ).getModules(context: context, fresh: false);
      }
    });
    super.initState();
  }

  final ScrollController scrollController = ScrollController();

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
        child: SafeArea(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(context),
                SizedBox(height: 20),
                Consumer<CarbonAcademyPro>(
                  builder: (context, pro, child) {
                    return Column(
                      children: [
                        GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          shrinkWrap: true,
                          primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 12,
                                mainAxisExtent: 212,
                              ),
                          itemCount: pro.modules.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Go.route(
                                  context,
                                  CarbonAcademy(model: pro.modules[index]),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.white70,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: themewhitecolor,
                                        border: Border.all(
                                          width: 1,
                                          color: themewhitecolor,
                                        ),
                                        borderRadius: BorderRadius.circular(11),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(11),
                                        child: Image.network(
                                          pro.modules[index].image,
                                          width: double.infinity,
                                          height: 130,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    15.kH,
                                    Text(
                                      pro.modules[index].title,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      // overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                    // 4.kH,
                                    // Spacer(),
                                  ],
                                ),
                              ),
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
                    );
                  },
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Text(
                //     "Welcome to the Carbon Academy",
                //     style: TextStyle(
                //       color: themewhitecolor,
                //       fontSize: 19,
                //       fontWeight: FontWeight.w500,
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 16,
                //     vertical: 16,
                //   ),
                //   child: Container(
                //     width: double.infinity,
                //     decoration: BoxDecoration(
                //       color: themewhitecolor,
                //       border: Border.all(width: 1, color: themewhitecolor),
                //       borderRadius: BorderRadius.circular(11),
                //     ),
                //     padding: EdgeInsets.all(1),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(11),
                //       child: Image.asset(
                //         "assets/images/png/carbon.png",
                //         width: double.infinity, // full screen width
                //         height: 280, // fixed height jaisa chahiye (adjust karen)
                //         fit: BoxFit
                //             .fitWidth, // width fit karega, height maintain rahegi
                //       ),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 15),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16),
                //   child: Text(
                //     "Learn how your everyday actions like recycling, saving energy, or using public transport reduce CO₂ emissions and earn you carbon credits. The Academy offers short, engaging lessons that explain carbon credits, offsets, and your real-world climate impact. \n \nComplete modules, earn badges, and unlock bonus credits as you build your knowledge. Empower yourself for a greener future—one lesson at a time.",
                //     style: TextStyle(fontSize: 17, color: themewhitecolor),
                //   ),
                // ),
              ],
            ),
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
                "Carbon Academy",
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
}
