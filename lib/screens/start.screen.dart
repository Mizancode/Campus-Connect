import 'package:campus_connect/global/text_controller.dart';
import 'package:campus_connect/provider/theme_dark_light.dart';
import 'package:campus_connect/screens/home_selecter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  final nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDarkLight>(
      builder: (context, mode, child) {
        return Scaffold(
            appBar: AppBar(),
            body: Container(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Just a step away !',
                      style: GoogleFonts.lexend(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: mode.themeDarkMode
                              ? Colors.white
                              : const Color.fromRGBO(3, 3, 3, 1)),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Name!';
                        }
                        return null;
                      },
                      controller: nameController,
                      decoration: InputDecoration(
                          hintText: 'Full name*',
                          hintStyle: GoogleFonts.lexend(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(201, 197, 201, 1)),
                          prefixIcon: Icon(
                            Icons.person,
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
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Field of Domain!';
                        }
                        return null;
                      },
                      controller: domainController,
                      decoration: InputDecoration(
                          hintText:
                              'Ex:Software Developer,Analytics,Business etc...',
                          hintStyle: GoogleFonts.lexend(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(201, 197, 201, 1)),
                          prefixIcon: Icon(
                            Icons.person,
                            color: mode.themeDarkMode
                                ? Colors.white
                                : Colors.black,
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(width: 1))),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeSelecter(
                                        name: nameController.text.toString(),
                                        domain:
                                            domainController.text.toString(),
                                      )));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Set the roundness of corners
                          ),
                          minimumSize: const Size(double.infinity, 50),
                          backgroundColor: const Color(0xff003366)),
                      child: Text(
                        'Let\'s Start',
                        style: GoogleFonts.lexend(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
