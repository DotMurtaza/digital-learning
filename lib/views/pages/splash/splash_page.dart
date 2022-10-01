import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_academy/constants/images.dart';
import 'package:online_academy/views/pages/authentication/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () => Get.offAll(() => LoginPage()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Images.splash),
          ),
        ),
      ),
    );
  }
}
