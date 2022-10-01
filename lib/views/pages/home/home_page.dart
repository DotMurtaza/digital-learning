import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_academy/Controllers/payment_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  var paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              paymentController.makePayment(context);
            },
            child: Text("ADD payment")),
      ),
    );
  }
}
