import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_academy/views/pages/diary/diary_page.dart';
import 'package:online_academy/views/widgets/imput_field.dart';
import 'package:online_academy/views/widgets/primary_button.dart';
import 'package:share_plus/share_plus.dart';

class GenerateCode extends StatelessWidget {
  GenerateCode({Key? key}) : super(key: key);
  final TextEditingController generateCodeController = TextEditingController();
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
                  Get.to(() => DiaryPage());
                }),
          ],
        ));
  }

  shareText(String text) {
    Share.share(text);
  }
}
