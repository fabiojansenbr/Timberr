import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timberr/constants.dart';
import 'package:timberr/controllers/auth_controller.dart';
import 'package:timberr/screens/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = AuthController();
  final _formKey = GlobalKey<FormState>();
  String email = '', password = '';
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 60),
        child: SingleChildScrollView(
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Flexible(
                    child: Divider(
                      color: Color(0xFFBDBDBD),
                      thickness: 1,
                      indent: 30,
                      endIndent: 20,
                    ),
                  ),
                  SvgPicture.asset("assets/furniture_vector.svg"),
                  const Flexible(
                    child: Divider(
                      color: Color(0xFFBDBDBD),
                      thickness: 1,
                      indent: 20,
                      endIndent: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 10, top: 30),
                child: Text(
                  "Hello !",
                  style: GoogleFonts.merriweather(
                    fontSize: 30,
                    color: const Color(0xFF909090),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 30),
                child: Text(
                  "WELCOME BACK",
                  style: GoogleFonts.merriweather(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: const Color(0xFF303030),
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  margin: const EdgeInsets.only(right: 30),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x408A959E),
                        offset: Offset(0, 7),
                        blurRadius: 30,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 35),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (val) {
                            email = val;
                          },
                          validator: (val) {
                            return (GetUtils.isEmail(val ?? ''))
                                ? null
                                : 'Please enter your email';
                          },
                          decoration:
                              inputDecorationConst.copyWith(labelText: "Email"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, top: 30),
                        child: TextFormField(
                          onChanged: (val) {
                            password = val;
                          },
                          validator: (val) {
                            if (val?.isEmpty ?? true) {
                              return 'Please enter a password';
                            } else {
                              if (val!.length < 6) {
                                return 'Password should be at least 6 characters long';
                              }
                              return null;
                            }
                          },
                          obscureText: !_showPassword,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: inputDecorationConst.copyWith(
                            labelText: "Password",
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(top: 25, right: 15),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _showPassword = !_showPassword;
                                  });
                                },
                                child: SvgPicture.asset(
                                  "assets/icons/password_visible.svg",
                                  height: 15,
                                  width: 20,
                                ),
                              ),
                            ),
                            suffixIconConstraints:
                                const BoxConstraints(maxWidth: 50),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () async {
                          if (GetUtils.isEmail(email)) {
                            await _authController.forgotPassword(email);
                          } else {
                            Get.dialog(AlertDialog(
                              title: const Text("Error"),
                              content: const Text(
                                  "Please enter a valid email address"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    navigator?.pop();
                                  },
                                  child: const Text("Ok"),
                                )
                              ],
                            ));
                          }
                        },
                        child: Text(
                          "Forgot Password",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF303030),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _authController.signIn(email, password);
                          }
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 30),
                          decoration: BoxDecoration(
                            color: const Color(0xFF303030),
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x50303030),
                                offset: Offset(0, 10),
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: Center(
                              child: Text(
                            "Sign In",
                            style: GoogleFonts.nunitoSans(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          )),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Get.off(() => const RegisterPage());
                        },
                        child: Text(
                          "SIGN UP",
                          style: GoogleFonts.nunitoSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF303030),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
