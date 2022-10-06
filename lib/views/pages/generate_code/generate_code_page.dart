import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_academy/views/pages/diary/diary_page.dart';
import 'package:online_academy/views/pages/home/widgets/second_vedio.dart';
import 'package:online_academy/views/widgets/imput_field.dart';
import 'package:online_academy/views/widgets/primary_button.dart';
import 'package:share_plus/share_plus.dart';

String _chars =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

class GenerateCode extends StatelessWidget {
  GenerateCode({Key? key}) : super(key: key);
  final TextEditingController generateCodeController =
      TextEditingController(text: getRandomString(10000));

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.black),
            )),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: InputField(
                      isEnabled: true,
                      hintText: "Code",
                      controller: generateCodeController,
                      vlaidator: (val) {
                        return null;
                      }),
                ),
                IconButton(
                  onPressed: () => shareText(generateCodeController.text),
                  icon: const Icon(Icons.share),
                  // onPressed: () {

                  //   // FlutterClipboard.copy(generateCodeController.text)
                  //   //     .then((value) {
                  //   //   return ScaffoldMessenger.of(context).showSnackBar(
                  //   //       const SnackBar(
                  //   //           content:
                  //   //               Text('Code has been copied to clipboard')));
                  //   // });
                  // },
                ),
              ],
            ),
            SizedBox(height: size.height * 0.05),
            PrimaryButton(
                size: size,
                text: "Enter to Class",
                onTap: () {
                  Get.to(() => SecondVedio());
                }),
          ],
        ));
  }

  shareText(String text) {
    Share.share(text);
  }
}
