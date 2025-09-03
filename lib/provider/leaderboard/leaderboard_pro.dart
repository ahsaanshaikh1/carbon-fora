import 'dart:developer';

import 'package:carbon_fora/helper/function_helper.dart';
import 'package:carbon_fora/model/leaderboard_model.dart';
import 'package:carbon_fora/utils/api.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LeaderboardPro with ChangeNotifier {
  bool isLoading = true;
  // String period = "all_time";
  List<RankModel> ranks = [];
  RankModel? userRank;
  getLeaderboardData({
    required BuildContext context,
    required String period,
  }) async {
    try {
      ranks = [];
      userRank = null;
      isLoading = true;

      notifyListeners();

      var res = await ApiHandler.getFunction(
        api: "${Api.user.leaderboard}?period=$period",
        authorization: true,

        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        ranks = [];
        userRank = RankModel.fromJson(res['userRank']);
        for (int i = 0; i < res['leaderboard'].length; i++) {
          ranks.add(RankModel.fromJson(res['leaderboard'][i]));
        }
        log(res.toString());
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
        showTopAlertError(
          text: res['message'] ?? "Something went wrong",
          context: context,
        );
      }
    } catch (e) {
      isLoading = false;
      notifyListeners();
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }
}
