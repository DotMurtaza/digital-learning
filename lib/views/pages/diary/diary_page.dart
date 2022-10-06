import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:online_academy/Controllers/add_subject_controller.dart';
import 'package:online_academy/constants/colors.dart';
import 'package:online_academy/models/add_subject_model.dart';
import 'package:online_academy/views/pages/documents/list_of_documents_page.dart';
import 'package:online_academy/views/widgets/imput_field.dart';

import 'components/diary_header.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({Key? key}) : super(key: key);

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  AddSubjectController subjectCon = Get.put(AddSubjectController());
  TextEditingController subjectController = TextEditingController();
  TextEditingController religionDaysController = TextEditingController();
  TextEditingController religionDescriptionController = TextEditingController();
  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  int? pages = 0;
  int? currentPage = 0;
  bool isReady = false;
  String errorMessage = '';
  String path = "";

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat format = DateFormat('dd MMM yyyy');
    final String formatted = format.format(now);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/topplan.jpeg',
                          width: MediaQuery.of(context).size.width * 0.3),
                      Text(formatted.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  DiaryHeader(size: size),
                  Column(
                    children: [
                      Diaryfooter(
                        subjectName: 'Religion',
                        hintAssignment: 'Description',
                        hintDays: 'Days',
                        size: size,
                        descriptionController: religionDescriptionController,
                        daysController: religionDaysController,
                        onChanged: (val) {},
                        valuecheckBox: false,
                      ),
                    ],
                  ),

                  // const Spacer(),
                  // SizedBox(
                  //   height: 300,
                  //   width: 300,
                  //   child: PDFView(
                  //     filePath: path,
                  //     enableSwipe: true,
                  //     swipeHorizontal: true,
                  //     autoSpacing: false,
                  //     pageFling: false,
                  //     onRender: (_pages) {
                  //       setState(() {
                  //         pages = _pages;
                  //         isReady = true;
                  //       });
                  //     },
                  //     onError: (error) {
                  //       if (kDebugMode) {
                  //         print(error.toString());
                  //       }
                  //     },
                  //     onPageError: (page, error) {
                  //       if (kDebugMode) {
                  //         print('$page: ${error.toString()}');
                  //       }
                  //     },
                  //     onViewCreated: (PDFViewController pdfViewController) {
                  //       _controller.complete(pdfViewController);
                  //     },
                  //     onPageChanged: (int? page, int? total) {
                  //       if (kDebugMode) {
                  //         print('page change: $page/$total');
                  //       }
                  //     },
                  //   ),
                  // ),
                  // // const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const ListofDocumentsPage());
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: ColorsClass.primaryColor,
                          child: Obx(
                            () => Text(
                              subjectCon.documents.length.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: ['pdf'],
                          );

                          if (result != null) {
                            setState(() {
                              File file = File(result.files.single.path!);
                              path = file.path;
                              print("File is  ${file.path}");
                              subjectCon.documents.add(path);
                              print(
                                  'Length of documents is:${subjectCon.documents.length}');
                            });
                            //  print("File is  ${file.path.length}");
                          } else {}
                        },
                        child: const Text('Add Document'),
                        style: ElevatedButton.styleFrom(
                          primary: ColorsClass.primary4,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addSubjectDialog(
      BuildContext context, subjectController, descriptionController) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Get.back();
      },
    );
    Widget addButton = TextButton(
      child: const Text("Add Subject"),
      onPressed: () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          InputField(
              hintText: "subject",
              controller: subjectController,
              vlaidator: (val) {
                return;
              }),
          const SizedBox(height: 20),
          InputField(
              hintText: "description",
              controller: descriptionController,
              vlaidator: (val) {
                return;
              }),
        ],
      ),
      actions: [
        cancelButton,
        addButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}

class Diaryfooter extends StatelessWidget {
  Diaryfooter({
    Key? key,
    required this.size,
    required this.descriptionController,
    required this.daysController,
    required this.subjectName,
    this.isComplete = false,
    required this.hintAssignment,
    required this.hintDays,
    required this.onChanged,
    required this.valuecheckBox,
  }) : super(key: key);
  final String subjectName;
  final String hintAssignment;
  final String hintDays;

  bool isComplete;
  final Size size;
  final TextEditingController descriptionController;
  final TextEditingController daysController;
  final Function(bool?)? onChanged;
  bool valuecheckBox;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.123,
      // color: Colors.red,
      child: Row(
        children: [
          Container(
              width: size.width * 0.2,
              height: size.height * 0.123,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2)),
              child: Center(
                child: Text(subjectName,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(color: Colors.black)),
              )),
          Container(
            height: size.height * 0.123,
            width: size.width * 0.55,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
            ),
            child: TextFormField(
              maxLines: 2,
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: hintAssignment,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
            //   child: Text('Religion',
            //       maxLines: 1,
            //       overflow: TextOverflow.ellipsis,
            //       style: Theme.of(context)
            //           .textTheme
            //           .subtitle1!
            //           .copyWith(color: Colors.black)),
            // ),
          ),
          Container(
            width: size.width * 0.2,
            height: size.height * 0.123,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 2)),
            child: Column(children: [
              TextFormField(
                maxLines: 1,
                controller: daysController,
                decoration: InputDecoration(
                    hintText: hintDays,
                    errorBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none),
              ),

              Checkbox(
                value: valuecheckBox,
                onChanged: onChanged,
              ),
              // const Text('Complete!',
              //     style: TextStyle(fontSize: 12))
            ]),
          ),
        ],
      ),
    );
  }
}
