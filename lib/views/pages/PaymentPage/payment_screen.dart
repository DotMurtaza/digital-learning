import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_academy/Controllers/payment_controller.dart';
import 'package:online_academy/views/pages/generate_code/generate_code_page.dart';
import 'package:online_academy/views/widgets/primary_button.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  var paymentController = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xff38b7fe),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/subscribe.jpeg'),
            PrimaryButton(
                size: size,
                text: "Subscribe",
                onTap: () => paymentController.makePayment(context))
          ],
        ),
      ),
    );
  }
}
