import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/common/roundbutton.dart';
import 'package:twitter_clone/constants/ui_constants.dart';
import 'package:twitter_clone/features/auth/view/signup_view.dart';
import 'package:twitter_clone/features/auth/widgets/auth_field.dart';
import 'package:twitter_clone/theme/theme.dart';

class LoginView extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const LoginView(),
      );
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final appbar = UIConstants.appBar();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Align(
                  alignment: Alignment.topLeft,
                  heightFactor: Checkbox.width,
                  child: Text(
                    "Welcome Back",
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
                        text: "Don't have an account yet?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 121, 120, 120),
                          fontSize: 16,
                        ),
                        children: [
                      TextSpan(
                          text: '  Sign Up',
                          style: TextStyle(color: Pallete.blueColor),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                SignUpView.route(),
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

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
