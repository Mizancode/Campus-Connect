import 'dart:io';

import 'package:campus_connect/global/file_image.dart';
import 'package:campus_connect/global/text_controller.dart';
import 'package:campus_connect/provider/theme_dark_light.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final imagePicker = ImagePicker();

  Future getGalleryImage() async {
    final imageFile = await imagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 80);
    if (imageFile != null) {
      image = File(imageFile.path);
      setState(() {});
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Image not Picked...'),
        duration: Duration(seconds: 1),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: size.width,
        child: Consumer<ThemeDarkLight>(
          builder: (context, mode, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: size.height * 0.23,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: image != null
                            ? FileImage(image!.absolute)
                                as ImageProvider<Object>
                            : const AssetImage('assets/images/User.png')),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                            height: size.height * 0.10,
                            width: size.width * 0.10,
                            decoration: const BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: IconButton(
                                onPressed: getGalleryImage,
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                ))),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onChanged: (value) {
                    domainController.text = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Field of Domain!';
                    }
                    return null;
                  },
                  controller: domainController,
                  decoration: InputDecoration(
                      hintText: domainController.text.toString(),
                      hintStyle: GoogleFonts.lexend(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(201, 197, 201, 1)),
                      prefixIcon: Icon(
                        Icons.person,
                        color: mode.themeDarkMode ? Colors.white : Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(width: 1))),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
