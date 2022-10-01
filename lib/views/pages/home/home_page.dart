import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_academy/Controllers/payment_controller.dart';
import 'package:online_academy/views/pages/generate_code/generate_code_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => GenerateCode());
              // paymentController.makePayment(context);
            },
            child: const Text("ADD payment")),
      ),
    );
  }
}
