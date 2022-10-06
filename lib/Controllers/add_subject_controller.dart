import 'package:get/get.dart';
import 'package:online_academy/models/add_subject_model.dart';

class AddSubjectController extends GetxController {
  Rxn<List<AddSubjectModel>> addSubject = Rxn<List<AddSubjectModel>>();
  List<AddSubjectModel>? get subject => addSubject.value;
  RxList<String> documents = <String>[].obs;
}
