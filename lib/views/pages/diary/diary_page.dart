import 'dart:core';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/diary_header.dart';

class DiaryPage extends StatelessWidget {
  DiaryPage({Key? key}) : super(key: key);
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    final DateFormat format = DateFormat('dd MMM yyyy');
    final String formatted = format.format(now);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Today\'s Plan',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(formatted.toString(),
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                DiaryHeader(size: size),
                Row(
                  children: [
                    Container(
                        width: size.width * 0.2,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: TextFormField(
                            maxLines: 2,
                            controller: subjectController,
                            decoration: const InputDecoration(
                                hintText: 'subject',
                                errorBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none),
                          ),

                          // child: Text('English',
                          //     style: Theme.of(context)
                          //         .textTheme
                          //         .subtitle1!
                          //         .copyWith(color: Colors.black)),
                        )),
                    Container(
                      width: size.width * 0.55,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextFormField(
                          maxLines: 2,
                          controller: descriptionController,
                          decoration: const InputDecoration(
                              hintText: 'Description',
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              focusedErrorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.2,
                      height: size.height * 0.09,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Column(children: [
                        Checkbox(value: false, onChanged: (val) {}),
                        const Text('Complete!', style: TextStyle(fontSize: 12))
                      ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
