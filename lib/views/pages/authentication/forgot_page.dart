import 'package:flutter/material.dart';
import 'package:online_academy/constants/colors.dart';
import 'package:online_academy/constants/mixin_validator.dart';
import 'package:online_academy/views/widgets/imput_field.dart';
import 'package:online_academy/views/widgets/primary_button.dart';

class ForgotPage extends StatelessWidget with ValidationMixin {
  ForgotPage({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorsClass.primary1,
              ColorsClass.primary2,
              ColorsClass.primar3,
              ColorsClass.primary4
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _key,
          child: Column(
            children: [
              Container(
                height: size.height * 0.4,
                width: size.width * 0.4,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 12)
                    ]),
                child: const Icon(
                  Icons.school,
                  size: 80,
                  color: ColorsClass.primaryColor,
                ),
              ),
              // AppLogo(size: size),
              // SizedBox(height: size.height * 0.02),
              Text(
                "Digital Education",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Enter your email to recover your password",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(height: size.height * 0.02),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InputField(
                  hintText: "Email",
                  isObsure: false,
                  controller: emailController,
                  vlaidator: (email) {
                    return isEmailValid(email!) ? null : 'Enter valid email';
                  },
                ),
              ),
              SizedBox(height: size.height * 0.02),
              PrimaryButton(
                onTap: () {
                  if (_key.currentState!.validate()) {}
                },
                text: 'Login',
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
