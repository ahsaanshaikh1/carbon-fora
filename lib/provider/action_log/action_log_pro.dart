import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:carbon_fora/helper/function_helper.dart';
import 'package:carbon_fora/model/action_log_m.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/utils/api.dart';
import 'package:carbon_fora/utils/dailog.dart';
import 'package:carbon_fora/utils/helper/error_handler.dart';
import 'package:carbon_fora/utils/helper/shared_preferences/preference_helper.dart';
import 'package:carbon_fora/views/action_log/action_submitted.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActionLogPro with ChangeNotifier {
  int current = 1;
  int total = 1;
  bool isLoading = false;
  List<ActionLog> logs = [];
  String? status = "All";
  getLogs({required BuildContext context, required bool fresh}) async {
    if (fresh) {
      logs = [];
      current = 1;
      total = 1;
    }
    if (!isLoading && current <= total) {
      try {
        isLoading = true;
        notifyListeners();
        var response = await ApiHandler.getFunction(
          api:
              "${Api.user.getActionLogs}?page=$current&status=${status != "All" ? status!.toUpperCase() : ""}",
          headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
          authorization: true,
          tokenKey: SharedPrefHelper.utils.authorizedToken,
        );
        if (response != null && response['success'] == true) {
          current += 1;
          total = response['pagination']['totalPages'];

          for (int i = 0; i < response['data'].length; i++) {
            logs.add(ActionLog.fromJson(response['data'][i]));
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

  logCyclingAction({
    required BuildContext context,
    required File image,
    required LatLng points,
    required String description,
    required double distance,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunctionMultipart(
        api: Api.user.actionLog,
        body: {
          "description": description,
          "details": jsonEncode({"distance": distance, "unit": "miles"}),
          "actionType": "cycling",
          "gpsLocation": jsonEncode({
            "type": "Point",
            "coordinates": [points.longitude, points.latitude],
          }),
        },
        field: "photoProof",
        file: image,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        Go.route(context, ActionSubmitted());

        showTopAlertInfo(text: res['message'], context: context);
      } else {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        showTopAlertError(text: res['message'], context: context);
      }
    } catch (e) {
      Go.pop(context);
      Go.pop(context);
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }

  logPublicTransportAction({
    required BuildContext context,
    required File image,
    required LatLng points,
    required String description,
    required double distance,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunctionMultipart(
        api: Api.user.actionLog,
        body: {
          "description": description,
          "details": jsonEncode({"distance": distance, "unit": "miles"}),
          "actionType": "public_transport",
          "gpsLocation": jsonEncode({
            "type": "Point",
            "coordinates": [points.longitude, points.latitude],
          }),
        },
        field: "photoProof",
        file: image,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        Go.route(context, ActionSubmitted());

        showTopAlertInfo(text: res['message'], context: context);
      } else {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        showTopAlertError(text: res['message'], context: context);
      }
    } catch (e) {
      Go.pop(context);
      Go.pop(context);
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }

  logWalkingAction({
    required BuildContext context,
    required File image,
    required LatLng points,
    required String description,
    required double distance,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunctionMultipart(
        api: Api.user.actionLog,
        body: {
          "description": description,
          "details": jsonEncode({"distance": distance, "unit": "miles"}),
          "actionType": "walking",
          "gpsLocation": jsonEncode({
            "type": "Point",
            "coordinates": [points.longitude, points.latitude],
          }),
        },
        field: "photoProof",
        file: image,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        Go.route(context, ActionSubmitted());

        showTopAlertInfo(text: res['message'], context: context);
      } else {
        Go.pop(context);
        Go.pop(context);
        Go.pop(context);
        showTopAlertError(text: res['message'], context: context);
      }
    } catch (e) {
      Go.pop(context);
      Go.pop(context);
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }

  logRecycleAction({
    required BuildContext context,
    required File image,
    required double weight,
    required String description,
    required String material,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunctionMultipart(
        api: Api.user.actionLog,
        body: {
          "description": description,
          "details": jsonEncode({"material": material, "mass": weight}),
          "actionType": "recycling",
        },
        field: "photoProof",
        file: image,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.route(context, ActionSubmitted());

        showTopAlertInfo(text: res['message'], context: context);
      } else {
        Go.pop(context);
        showTopAlertError(text: res['message'], context: context);
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }

  logSecondhandAction({
    required BuildContext context,
    required File image,
    required double weight,
    required String description,
    required String fabric,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunctionMultipart(
        api: Api.user.actionLog,
        body: {
          "description": description,
          "details": jsonEncode({"fabric": fabric, "weight": weight}),
          "actionType": "buying_secondhand",
        },
        field: "photoProof",
        file: image,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.route(context, ActionSubmitted());

        showTopAlertInfo(text: res['message'], context: context);
      } else {
        Go.pop(context);
        showTopAlertError(text: res['message'], context: context);
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }

  logTreePlantAction({
    required BuildContext context,
    required File image,
    required int trees,
    required String description,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunctionMultipart(
        api: Api.user.actionLog,
        body: {
          "description": description,
          "details": jsonEncode({"trees": trees}),
          "actionType": "tree_plantation",
        },
        field: "photoProof",
        file: image,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.route(context, ActionSubmitted());

        showTopAlertInfo(text: res['message'], context: context);
      } else {
        Go.pop(context);
        showTopAlertError(text: res['message'], context: context);
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }

  logWaterBottlesAction({
    required BuildContext context,
    required File image,
    required int bottles,
    required String description,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunctionMultipart(
        api: Api.user.actionLog,
        body: {
          "description": description,
          "details": jsonEncode({"bottles": bottles}),
          "actionType": "refill_water",
        },
        field: "photoProof",
        file: image,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.route(context, ActionSubmitted());

        showTopAlertInfo(text: res['message'], context: context);
      } else {
        Go.pop(context);
        showTopAlertError(text: res['message'], context: context);
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }

  logPlantBasedMealAction({
    required BuildContext context,
    required File image,
    required double weight,
    required String description,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunctionMultipart(
        api: Api.user.actionLog,
        body: {
          "description": description,
          "details": jsonEncode({"weight": weight}),
          "actionType": "plant_based_meal",
        },
        field: "photoProof",
        file: image,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        Go.route(context, ActionSubmitted());

        showTopAlertInfo(text: res['message'], context: context);
      } else {
        Go.pop(context);
        showTopAlertError(text: res['message'], context: context);
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(text: "Something went wrong", context: context);
    }
  }
}
