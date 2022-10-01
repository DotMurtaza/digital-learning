import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:online_academy/Utils/utils.dart';
import 'package:online_academy/views/pages/home/home_page.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> signUp(
      {fName, lName, email, password, required BuildContext context}) async {
    Utils.showLoadingDialog(context: context, text: 'Registering...');
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await firestore.collection('teachers').doc(value.user!.uid).set({
          "firstName": fName,
          "lastName": lName,
          "email": email,
          "profileImage": "",
          "teacherId": value.user!.uid
        }).then((value) {
          Get.back();
          Get.offAll(HomePage());
        });
      });
    } catch (e) {
      Get.back();
      Utils.showSnackBar(context, e.toString());
    }
  }

  Future<void> singIn({email, password, required BuildContext context}) async {
    Utils.showLoadingDialog(context: context, text: 'Sign In...');
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.back();
        Get.offAll(() => HomePage());
      });
    } catch (e) {
      Get.back();
      Utils.showSnackBar(context, e.toString());
      print("Errro is here : " + e.toString());
    }
  }
}
