import 'dart:developer';

import 'package:carbon_fora/helper/function_helper.dart';
import 'package:carbon_fora/route_structure/go_navigator.dart';
import 'package:carbon_fora/utils/api.dart';
import 'package:carbon_fora/utils/dailog.dart';
import 'package:carbon_fora/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class WalletPro with ChangeNotifier {
  bool isLoading = true;
  Map? map = {};
  getWallet() async {
    try {
      isLoading = true;
      notifyListeners();
      var res = await ApiHandler.getFunction(
        api: Api.user.wallet,
        authorization: true,
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        map = res['wallet'];
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        notifyListeners();
      }
      log(res.toString());
    } catch (e) {
      isLoading = false;
      notifyListeners();
    }
  }

  revealPrivateKey({
    required BuildContext context,
    required String pass,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunction(
        api: Api.user.walletReveal,
        authorization: true,
        body: {"password": pass},
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        Go.pop(context);
        showKeyPopup(context, res['privateKey']);
      } else {
        Go.pop(context);
        showTopAlertError(
          context: context,
          text: res['message'] ?? "Something went wrong",
        );
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(context: context, text: "Something went wrong");
    }
  }

  revealPrivateKey1({
    required BuildContext context,
    required String pass,
  }) async {
    try {
      CustomDailog.loadingDailog(context);
      var res = await ApiHandler.postFunction(
        api: Api.user.walletReveal,
        authorization: true,
        body: {"password": pass},
        headers: {'x-api-key': '9f8e2a3b-7c4d-4e9a-b1c0-6d5f8e7a9b2c'},
      );
      if (res != null && res['success']) {
        Go.pop(context);
        showKeyPopup(context, res['privateKey']);
      } else {
        Go.pop(context);
        showTopAlertError(
          context: context,
          text: res['message'] ?? "Something went wrong",
        );
      }
    } catch (e) {
      Go.pop(context);
      showTopAlertError(context: context, text: "Something went wrong");
    }
  }

  void showKeyPopup(BuildContext context, String key) {
    final TextEditingController passwordController = TextEditingController(
      text: key,
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text("Private Key"),
          content: TextField(
            controller: passwordController,
            readOnly: true,
            decoration: const InputDecoration(
              labelText: "Key",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            // TextButton(
            //   onPressed: () => Navigator.pop(context), // close popup
            //   child: const Text("Cancel"),
            // ),
            ElevatedButton(
              onPressed: () async {
                await Clipboard.setData(
                  ClipboardData(text: passwordController.text),
                );
                showTopAlertInfo(text: "Copied to clipboard", context: context);
              },
              child: const Text("Copy"),
            ),
            ElevatedButton(
              onPressed: () {
                Go.pop(context);
                // Provider.of<WalletPro>(context, listen: false).revealPrivateKey(
                //   context: context,
                //   pass: passwordController.text,
                // );
                // final password = passwordController.text;
                // Navigator.pop(context); // close popup
                // ScaffoldMessenger.of(
                //   context,
                // ).showSnackBar(SnackBar(content: Text("Password: $password")));
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }
}
