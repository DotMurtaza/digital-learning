import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_academy/constants/colors.dart';

showSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(text)));
}

class Utils {
  static final _selectedDate = DateTime.now();

  static final _initialTime = TimeOfDay.now();

  static String formatPrice(double price) => '\$${price.toStringAsFixed(1)}';

  // static String formatDate(var date) {
  //   late DateTime _dateTime;
  //   if (date is String) {
  //     _dateTime = DateTime.parse(date);
  //   } else {
  //     _dateTime = date;
  //   }
  //   _dateTime = _dateTime.toLocal();

  //   return DateFormat.yMMMMd().format(_dateTime);
  // }

  // static String numberCompact(num number) =>
  //     NumberFormat.compact().format(number);

  // static String timeAgo(String? time) {
  //   try {
  //     if (time == null) return '';
  //     return timeago.format(DateTime.parse(time));
  //   } catch (e) {
  //     return '';
  //   }
  // }

  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(message, textAlign: TextAlign.center),
    ));
  }

  static Future showCustomDialog(BuildContext context,
      {required Widget child}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        );
      },
    );
  }

  static Future showLoadingDialog(
      {required BuildContext context, required String text}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Row(
              children: [
                const CircularProgressIndicator(color: ColorsClass.primary4),
                const SizedBox(
                  width: 40,
                ),
                Text(text)
              ],
            ),
          ),
        );
      },
    );
  }

  static showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text("Log out?"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            CupertinoDialogAction(
                isDefaultAction: false,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel")),
            CupertinoDialogAction(
                textStyle: const TextStyle(color: Colors.red),
                isDefaultAction: true,
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: const Text("Log out")),
          ],
        );
      },
    );
  }

  // static void showCustomDialog(BuildContext context, Widget child,
  //     {VoidCallback? onTap}) {
  //   showGeneralDialog(
  //     context: context,
  //     barrierDismissible: true,
  //     barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
  //     transitionDuration: const Duration(milliseconds: 200),
  //     pageBuilder: (BuildContext context, Animation first, Animation second) {
  //       return BackdropFilter(
  //         filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
  //         child: Container(
  //           height: MediaQuery.of(context).size.height,
  //           width: MediaQuery.of(context).size.width,
  //           color: Colors.black26,
  //           child: Stack(
  //             fit: StackFit.expand,
  //             alignment: Alignment.center,
  //             children: [
  //               Positioned(
  //                 top: 32,
  //                 left: 18,
  //                 child: GestureDetector(
  //                   child: Container(
  //                     height: 48,
  //                     width: 48,
  //                     decoration: BoxDecoration(
  //                       color: Colors.black,
  //                       borderRadius: BorderRadius.circular(16),
  //                     ),
  //                     alignment: Alignment.center,
  //                     child: const Icon(
  //                       Icons.close,
  //                       color: Colors.white,
  //                       size: 16,
  //                     ),
  //                   ),
  //                   onTap: onTap,
  //                 ),
  //               ),
  //               child,
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
