import 'package:flutter/material.dart';

class AppUtils {
   void showAppBottomSheet(
      {required BuildContext context, required Widget body}) {
    showModalBottomSheet(
        enableDrag: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12), topLeft: Radius.circular(12))),
        context: context,
        builder: (context) {
          return body;
        });
  }

   void showAppDialog(
      {required BuildContext context, required Widget body}) {
    showDialog(
        context: context,
        builder: (context) => body);
  }

   void showAppSnackBar(
      {required BuildContext context, required String message}) {
    SnackBar snackBar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
