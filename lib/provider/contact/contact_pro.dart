import 'package:carbon_fora/helper/function_helper.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/utils/api.dart';
import 'package:carbon_fora/utils/dailog.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/material.dart';

class ContactPro with ChangeNotifier {
  contact({
    required BuildContext context,
    required String email,
    required String fName,
    required String lName,
    required String phone,
    required String question,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunction(
        api: Api.user.contact,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},

        body: {
          "firstName": fName,
          "lastName": lName,
          "email": email,
          "phone": phone,
          "question": question,
        },
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        showTopAlertInfo(text: "Success", context: context);
      } else {
        Go.pop(context);
        showTopAlertInfo(
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
