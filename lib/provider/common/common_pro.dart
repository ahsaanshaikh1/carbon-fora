import 'dart:developer';

import 'package:carbon_fora/helper/function_helper.dart';
import 'package:carbon_fora/model/category_model.dart';
import 'package:carbon_fora/utils/api.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class CommonPro with ChangeNotifier {
  List<Category> categories = [];
  getCategories() async {
    try {
      categories = [];
      var res = await ApiHandler.getFunction(
        api: Api.common.common + "?category=true",
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['error'] == false) {
        for (int i = 0; i < res['data']['categories'].length; i++) {
          categories.add(Category.fromJson(res['data']['categories'][i]));
        }
        notifyListeners();
      }
    } catch (e) {
      log("error");
    }
  }
}
