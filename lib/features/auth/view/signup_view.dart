import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/common.dart';
import 'package:twitter_clone/constants/ui_constants.dart';
import 'package:twitter_clone/features/auth/view/login_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/pallete.dart';

class SignUpView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpView(),
      );
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  heightFactor: Checkbox.width,
                  child: Text(
                    "Sign Up!",
                    style: TextStyle(
                      fontSize: 30,
                      height: -1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //textfield1
                AuthField(
                  controller: emailController,
                  hintText: 'Email',
                ),
                const SizedBox(
                  height: 25,
                ),
                //textfield2
                AuthField(
                  controller: passwordController,
                  hintText: 'Password',
                ),
                //button
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: RoundButton(
                    onTap: () {},
                    label: 'Done',
                    backgroundColor: Pallete.whiteColor,
                    textColor: Pallete.backgroundColor,
                  ),
                ),
                //textspan
                const SizedBox(
                  height: 35,
                ),
                RichText(
                    text: TextSpan(
                        text: "Already have an account?",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 121, 120, 120),
                          fontSize: 16,
                        ),
                        children: [
                      TextSpan(
                          text: '  Login',
                          style: const TextStyle(color: Pallete.blueColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                LoginView.route(),
                              );
                            })
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
