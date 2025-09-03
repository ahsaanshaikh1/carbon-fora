import 'package:carbon_fora/helper/function_helper.dart';
import 'package:carbon_fora/model/blog_model.dart';
import 'package:carbon_fora/utils/api.dart';
import 'package:carbon_fora/utils/helper/error_handler.dart';
import 'package:carbon_fora/utils/helper/shared_preferences/preference_helper.dart';
import 'package:flutter/material.dart';

class CarbonAcademyPro with ChangeNotifier {
  bool isLoading = false;
  int current = 1;
  int total = 1;
  List<BlogModel> modules = [];
  getModules({required BuildContext context, required bool fresh}) async {
    if (fresh) {
      modules = [];
      current = 1;
      total = 1;
    }
    if (!isLoading && current <= total) {
      try {
        isLoading = true;
        notifyListeners();
        var response = await ApiHandler.getFunction(
          api: "${Api.user.blogs}?page=$current",
          headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
          authorization: true,
          tokenKey: SharedPrefHelper.utils.authorizedToken,
        );
        if (response != null && response['success'] == true) {
          current += 1;
          total = response['pagination']['totalPages'];

          for (int i = 0; i < response['data'].length; i++) {
            modules.add(BlogModel.fromJson(response['data'][i]));
          }

          isLoading = false;
          notifyListeners();
        } else {
          isLoading = false;
          notifyListeners();

          ErrorHandler.apiException(
            context,
            response['message'] ?? "Something went wrong",
          );
        }
      } catch (e) {
        isLoading = false;
        notifyListeners();
        ErrorHandler.apiException(context, "Something went wrong");
      }
    }
  }
}
