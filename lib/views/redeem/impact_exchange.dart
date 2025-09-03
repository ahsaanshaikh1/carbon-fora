import 'package:carbon_fora/model/product_model.dart';
import 'package:carbon_fora/model/voucher_model.dart';
import 'package:carbon_fora/provider/common/common_pro.dart';
import 'package:carbon_fora/provider/voucher/voucher_pro.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/theme/colors.dart';
import 'package:carbon_fora/theme/font_structures.dart';
import 'package:carbon_fora/theme/spacing.dart';
import 'package:carbon_fora/views/product/prod_detail.dart';
import 'package:carbon_fora/views/redeem/voucher_detail.dart';
import 'package:carbon_fora/widgets/empty_widget.dart';
import 'package:carbon_fora/widgets/filled_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImpactExchange extends StatefulWidget {
  final bool isBackButtonVisible;
  const ImpactExchange({super.key, required this.isBackButtonVisible});

  @override
  State<ImpactExchange> createState() => _ImpactExchangeState();
}

class _ImpactExchangeState extends State<ImpactExchange> {
  String selectedChip = "All"; // Default selected chip
  int select = 0;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        select == 0
            ? Provider.of<VoucherPro>(context, listen: false).getVoucher(
                fresh: false,
                context: context,
                categId: category == null ? "" : category!,
              )
            : Provider.of<VoucherPro>(context, listen: false).getProducts(
                fresh: false,
                context: context,
                categId: category == null ? "" : category!,
              );
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((val) {
      Provider.of<VoucherPro>(
        context,
        listen: false,
      ).getVoucher(context: context, categId: "", fresh: true);
    });
    super.initState();
  }

  final chips = ["All", "Fashion", "Personal Care", "Travel"];
  String? category;

  @override
  Widget build(BuildContext context) {
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
                    Center(
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
                  controller: scrollController,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 185,
                            child: DropdownButtonFormField(
                              hint: Text(
                                "Select Category",
                                style: TextStyle(
                                  color: themewhitecolor.withOpacity(.8),
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
                                    color:
                                        Colors.white, // White border on focus
                                    width: 1.5,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                  ),
                                ),
                                contentPadding: const EdgeInsets.all(8),
                              ),
                              value: category,
                              dropdownColor: Palette.themecolor,
                              menuMaxHeight: 200,
                              isDense: true,
                              items:
                                  Provider.of<CommonPro>(context, listen: false)
                                      .categories
                                      .map(
                                        (item) => DropdownMenuItem(
                                          value: item.id,
                                          child: SizedBox(
                                            width: 142,
                                            child: Text(
                                              item.name,
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: themewhitecolor,
                                              ),
                                              maxLines: 1,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList(),
                              onChanged: (item) {
                                category = item;
                                if (select == 0) {
                                  Provider.of<VoucherPro>(
                                    context,
                                    listen: false,
                                  ).getVoucher(
                                    fresh: true,
                                    context: context,
                                    categId: category == null ? "" : category!,
                                  );
                                } else {
                                  Provider.of<VoucherPro>(
                                    context,
                                    listen: false,
                                  ).getProducts(
                                    fresh: true,
                                    context: context,
                                    categId: category == null ? "" : category!,
                                  );
                                }
                              },
                            ),
                          ),
                          15.kW,
                        ],
                      ),

                      20.kH,
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: FilledBox(
                          padding: EdgeInsets.all(10),
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(11),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              2,
                              (index) => Expanded(
                                child: FilledBox(
                                  onTap: () {
                                    setState(() {
                                      select = index;
                                    });
                                    if (select == 0) {
                                      Provider.of<VoucherPro>(
                                        context,
                                        listen: false,
                                      ).getVoucher(
                                        fresh: true,

                                        context: context,
                                        categId: category == null
                                            ? ""
                                            : category!,
                                      );
                                    } else {
                                      Provider.of<VoucherPro>(
                                        context,
                                        listen: false,
                                      ).getProducts(
                                        fresh: true,
                                        context: context,
                                        categId: category == null
                                            ? ""
                                            : category!,
                                      );
                                    }
                                  },
                                  padding: const EdgeInsets.all(10),
                                  color: select == index
                                      ? Colors.white
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(11),
                                  child: Center(
                                    child: Text(
                                      index == 0 ? "Vouchers" : "Products",
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
                      ),

                      20.kH,
                      Consumer<VoucherPro>(
                        builder: (context, pro, child) {
                          return Column(
                            children: [
                              select == 0
                                  ? GridView.builder(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 12,
                                            mainAxisSpacing: 12,
                                            mainAxisExtent: 250,
                                          ),
                                      itemCount: pro.vouchers.length,
                                      itemBuilder: (context, index) {
                                        return BadgeCard(
                                          voucher: pro.vouchers[index],
                                        );
                                      },
                                    )
                                  : GridView.builder(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 12,
                                            mainAxisSpacing: 12,
                                            mainAxisExtent: 250,
                                          ),
                                      itemCount: pro.products.length,
                                      itemBuilder: (context, index) {
                                        return ProductCard(
                                          product: pro.products[index],
                                        );
                                      },
                                    ),

                              pro.isLoading
                                  ? Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        10,
                                        70,
                                        10,
                                        10,
                                      ),
                                      child: Center(
                                        child: CircularProgressIndicator(
                                          color: themewhitecolor,
                                        ),
                                      ),
                                    )
                                  : (pro.vouchers.isEmpty && select == 0) ||
                                        (pro.products.isEmpty && select == 1)
                                  ? Padding(
                                      padding: const EdgeInsets.only(top: 70),
                                      child: emptyWidget(),
                                    )
                                  : 0.kH,
                            ],
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
  final VoucherModel voucher;
  const BadgeCard({required this.voucher});

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
            backgroundImage: NetworkImage(voucher.brand.companyLogo),
          ),
          10.kH,
          Text(
            voucher.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
          4.kH,
          Expanded(
            child: Text(
              voucher.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
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
              Go.route(context, VoucherDetail(model: voucher));
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

class ProductCard extends StatelessWidget {
  final ProductModel product;
  const ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Go.route(context, ProductDetail(model: product));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.white70),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: themewhitecolor,
                border: Border.all(width: 1, color: themewhitecolor),
                borderRadius: BorderRadius.circular(11),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: Image.network(
                  product.brand.companyLogo,
                  width: double.infinity, // full screen width
                  height: 130, // fixed height jaisa chahiye (adjust karen)
                  fit: BoxFit
                      .fitWidth, // width fit karega, height maintain rahegi
                ),
              ),
            ),
            20.kH,
            Text(
              product.name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
            ),
            4.kH,
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "PKR ${product.retailPrice}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
