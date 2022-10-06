import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_academy/Controllers/add_subject_controller.dart';
import 'package:online_academy/constants/colors.dart';

class ListofDocumentsPage extends StatefulWidget {
  const ListofDocumentsPage({Key? key}) : super(key: key);

  @override
  State<ListofDocumentsPage> createState() => _ListofDocumentsPageState();
}

class _ListofDocumentsPageState extends State<ListofDocumentsPage> {
  final AddSubjectController subjectController =
      Get.put(AddSubjectController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView.builder(
            itemCount: subjectController.documents.length,
            shrinkWrap: true,
            itemBuilder: ((context, index) {
              return subjectController.documents.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.document_scanner, size: 30),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                width: size.width * 0.7,
                                child: Text(
                                  subjectController.documents[index],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    subjectController.documents.removeAt(index);
                                  });
                                },
                                child: const CircleAvatar(
                                  radius: 15,
                                  backgroundColor: ColorsClass.primaryColor,
                                  child: Icon(Icons.remove),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text('No documents found',
                          style: TextStyle(color: ColorsClass.primaryColor)),
                    );
            }),
          ),
        ),
      ),
    );
  }
}
