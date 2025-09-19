import 'dart:developer';

import 'package:carbon_fora/helper/function_helper.dart';
import 'package:carbon_fora/model/product_model.dart';
import 'package:carbon_fora/model/voucher_model.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/utils/api.dart';
import 'package:carbon_fora/utils/dailog.dart';
import 'package:carbon_fora/views/redeem/redemption_confirm.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class VoucherPro with ChangeNotifier {
  bool isLoading = false;
  bool isLoadingHistory = true;
  List<VoucherModel> vouchers = [];
  int current = 1;
  int total = 1;
  int current1 = 1;
  int total1 = 1;
  List redeemHistory = [];
  List<ProductModel> products = [];
  getVoucher({
    required BuildContext context,
    required String categId,
    required String subCategId,
    required bool fresh,
  }) async {
    if (fresh) {
      vouchers = [];
      current = 1;
      total = 1;
    }
    if (!isLoading && current <= total) {
      try {
        isLoading = true;
        notifyListeners();
        // vouchers = [];
        var res = await ApiHandler.getFunction(
          api: Api.user.voucher + "?page=$current&category=$categId&subCategory=$subCategId",
          authorization: true,
          headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
        );
        if (res != null && res['success']) {
          current += 1;
          if (fresh) {
            total = res['pagination']['totalPages'];
          }
          for (int i = 0; i < res['vouchers'].length; i++) {
            vouchers.add(VoucherModel.fromJson(res['vouchers'][i]));
          }
          isLoading = false;
          notifyListeners();
        } else {
          // vouchers = [];
          isLoading = false;
          notifyListeners();
          showTopAlertError(
            text: res['message'] ?? "Something went wrong",
            context: context,
          );
        }
      } catch (e) {
        // vouchers = [];
        isLoading = false;
        notifyListeners();
        showTopAlertError(text: "Something went wrong", context: context);
      }
    }
  }

  getHistory() async {
    try {
      redeemHistory = [];
      isLoadingHistory = true;
      notifyListeners();
      var res = await ApiHandler.getFunction(
        api: Api.user.voucherRedemption,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        for (int i = 0; i < res['redemptions'].length; i++) {
          redeemHistory.add(res['redemptions'][i]);
        }
      } else {}
      isLoadingHistory = false;
      notifyListeners();
    } catch (e) {
      isLoadingHistory = false;
      notifyListeners();
    }
  }

  getProducts({
    required BuildContext context,
    required String categId,
    required bool fresh,
    required String subCategId,
  }) async {
    if (fresh) {
      products = [];
      current1 = 1;
      total1 = 1;
    }
    if (!isLoading && current1 <= total1) {
      try {
        isLoading = true;
        notifyListeners();
        var res = await ApiHandler.getFunction(
          api: Api.user.product + "?page=$current1&category=$categId&subCategory=$subCategId",
          authorization: true,
          headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
        );
        if (res != null && res['success']) {
          if (fresh) {
            total1 = res['pagination']['totalPages'];
          }
          current1 += 1;

          for (int i = 0; i < res['products'].length; i++) {
            products.add(ProductModel.fromJson(res['products'][i]));
          }
          isLoading = false;
          notifyListeners();
        } else {
          // products = [];
          isLoading = false;
          notifyListeners();
          showTopAlertError(
            text: res['message'] ?? "Something went wrong",
            context: context,
          );
        }
      } catch (e) {
        // products = [];
        isLoading = false;
        notifyListeners();
        showTopAlertError(text: "Something went wrong", context: context);
      }
    }
  }

  voucherRedeem({
    required BuildContext context,
    required String voucherId,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunction(
        api: Api.user.voucherRedemption,
        authorization: true,
        body: {"voucherId": voucherId, "type": "voucher"},
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        // showTopAlertInfo(text: res['message'], context: context);
        Go.route(context, RedemptionConfirmation(data: res['redemption']));
      } else {
        Go.pop(context);
        showTopAlertError(
          text: res['message'] ?? "Something went wrong",
          context: context,
        );
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }

  productPurchase({
    required BuildContext context,
    required String productId,
    required String name,
    required String email,
    required String phone,
    required String address,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunction(
        api: Api.user.voucherRedemption,
        authorization: true,
        body: {
          "productId": productId,
          "type": "product",
          "shippingDetails": {
            "name": name,
            "email": email,
            "phone": phone,
            "address": address,
          },
        },
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        showTopAlertInfo(
          text: res['message'] ?? "Product purchased successfully",
          context: context,
        );
        // Go.route(context, RedemptionConfirmation(data: res['redemption']));
      } else {
        Go.pop(context);
        showTopAlertError(
          text: res['message'] ?? "Something went wrong",
          context: context,
        );
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }
}
