import 'package:campus_connect/provider/theme_dark_light.dart';
import 'package:campus_connect/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool loading = false;
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void signUp() {
      loading = true;
      setState(() {});
      _firebaseAuth
          .createUserWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        loading = false;
        setState(() {});
        emailController.clear();
        passwordController.clear();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('User Sign Up Successfully...'),
          duration: Duration(seconds: 1),
        ));
      })
          // ignore: non_constant_identifier_names, avoid_types_as_parameter_names
          .onError((error, StackTrace) {
        loading = false;
        setState(() {});
        return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.toString()),
          duration: const Duration(seconds: 1),
        ));
      });
    }

    return Consumer<ThemeDarkLight>(
      builder: (context, mode, child) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: ((size.height / 2) / size.height) * size.height,
                  width: size.width,
                  decoration: const BoxDecoration(
                      color: Color(0xff003366),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/lottie/Login.json',
                          height: (((size.height / 2) / size.height) *
                                  size.height) *
                              0.82),
                      Text(
                        'India’s 1st Dynamic Job Seeking App',
                        style: GoogleFonts.lexend(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(252, 255, 247, 1)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            style: GoogleFonts.lexend(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: mode.themeDarkMode
                                  ? Colors.white
                                  : const Color.fromRGBO(123, 123, 123, 1),
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigate to another screen when the text is tapped
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Login()),
                                      );
                                    },
                                  text: 'Log In ',
                                  style: TextStyle(
                                      color: mode.themeDarkMode
                                          ? Colors.amberAccent
                                          : const Color(0xff003366))),
                              const TextSpan(
                                text: 'with Campus Hiring',
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a Email Please';
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: GoogleFonts.lexend(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: mode.themeDarkMode
                                    ? Colors.white
                                    : Colors.black),
                            prefixIcon: Icon(
                              Icons.mail,
                              color: mode.themeDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(width: 1))),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter a Password Please';
                          }
                          return null;
                        },
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle: GoogleFonts.lexend(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: mode.themeDarkMode
                                    ? Colors.white
                                    : Colors.black),
                            prefixIcon: Icon(
                              Icons.lock,
                              color: mode.themeDarkMode
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(width: 1))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            signUp();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Set the roundness of corners
                            ),
                            minimumSize: const Size(double.infinity, 50),
                            backgroundColor: const Color(0xff003366)),
                        child: loading
                            ? const CircularProgressIndicator.adaptive(
                                backgroundColor: Colors.white,
                              )
                            : Text(
                                'Sign Up',
                                style: GoogleFonts.lexend(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: GoogleFonts.lexend(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: mode.themeDarkMode
                                  ? Colors.white
                                  : const Color.fromRGBO(123, 123, 123, 1),
                            ),
                            children: <TextSpan>[
                              TextSpan(text: 'By continuing, I accept '),
                              TextSpan(
                                  text: 'Terms & Conditions ',
                                  style: TextStyle(
                                      color: mode.themeDarkMode
                                          ? Colors.amberAccent
                                          : const Color(0xff003366))),
                              const TextSpan(text: 'and '),
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                      color: mode.themeDarkMode
                                          ? Colors.amberAccent
                                          : const Color(0xff003366))),
                            ]),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
      },
    );
  }
}