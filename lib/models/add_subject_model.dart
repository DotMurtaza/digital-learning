import 'package:cloud_firestore/cloud_firestore.dart';

class AddSubjectModel {
  String? id;
  String? subject;
  String? description;
  bool? isComplete;
  AddSubjectModel({
    required this.subject,
    required this.description,
    this.isComplete = false,
  });
  // AddSubjectModel.fromSnapshot(DocumentSnapshot data) {
  //   id = this.id;
  //   subject = data['subject'] ?? '';
  //   description = data['description'] ?? '';
  //   isComplete = data['isComplete'] ?? false;
  // }

}

List<AddSubjectModel> allSubjects = [
  AddSubjectModel(
      subject: "English",
      description:
          "this subject is our english subject and i'm your new teacher and i teach you english",
      isComplete: false),
  AddSubjectModel(
      subject: "Arabic",
      description:
          "this subject is our arabic subject and i'm your new teacher and i teach you english",
      isComplete: false),
];
