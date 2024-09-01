import 'dart:io';

import 'package:campus_connect/global/file_image.dart';
import 'package:campus_connect/helper/hive_pref.dart';
import 'package:campus_connect/models/job.dart';
import 'package:campus_connect/models/recent_job.dart';
import 'package:campus_connect/provider/theme_dark_light.dart';
import 'package:campus_connect/screens/search_screen.dart';
import 'package:campus_connect/screens/user_profile_screen.dart';
import 'package:campus_connect/widget/recent_job.dart';
import 'package:campus_connect/widget/recommend_job.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final String name;
  final String domain;
  const Home({super.key, required this.name, required this.domain});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationSlideDown;
  late Animation<Offset> _animationSlideRight;
  late Animation<Offset> _animationSlideLeft;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );
    _animationSlideDown = Tween(begin: const Offset(0, -1), end: Offset.zero)
        .animate(_controller);
    _animationSlideRight =
        Tween(begin: const Offset(1, 0), end: Offset.zero).animate(_controller);
    _animationSlideLeft = Tween(begin: const Offset(-1, 0), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ThemeDarkLight>(
      builder: (context, mode, child) {
        return Scaffold(
          body: SafeArea(child: Consumer<ThemeDarkLight>(
            builder: (context, mode, child) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SlideTransition(
                        position: _animationSlideDown,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UserProfile())),
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: image!=null? FileImage(image!.absolute)
                                as ImageProvider<Object> : const NetworkImage(
                                              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/12/User_icon_2.svg/640px-User_icon_2.svg.png')),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.64,
                                      child: Text(
                                        'Hi, ${widget.name}',
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.lexend(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w400,
                                            color: mode.themeDarkMode
                                                ? Colors.white
                                                : const Color(0xff003366)),
                                      ),
                                    ),
                                    Text(
                                      widget.domain,
                                      style: GoogleFonts.lexend(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: const Color.fromRGBO(
                                              123, 123, 123, 1)),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    !Pref.currentThemeMode
                                        ? Pref.currentThemeMode = true
                                        : Pref.currentThemeMode = false;
                                    mode.changeThemeMode();
                                  },
                                  child: Icon(
                                    mode.themeDarkMode
                                        ? Icons.dark_mode
                                        : Icons.sunny,
                                    size: 30,
                                    color: mode.themeDarkMode
                                        ? Colors.white
                                        : const Color(0xff003366),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Search())),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.search,
                                  size: 30,
                                ),
                                hintText: 'Search',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SlideTransition(
                        position: _animationSlideRight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Recommendation',
                                style: GoogleFonts.openSans(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    color: mode.themeDarkMode
                                        ? Colors.white
                                        : const Color.fromRGBO(3, 3, 3, 1))),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: (200 / size.height) * size.height,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: jobList.length,
                                  itemBuilder: (context, index) {
                                    return RecommendJob(
                                      job: jobList[index],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SlideTransition(
                        position: _animationSlideLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Recent Job',
                                style: GoogleFonts.openSans(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700,
                                    color: mode.themeDarkMode
                                        ? Colors.white
                                        : const Color.fromRGBO(3, 3, 3, 1))),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: (220 / size.height) * size.height,
                              child: ListView.builder(
                                  itemCount: jobList.length,
                                  itemBuilder: (context, index) {
                                    return RecentJobs(
                                      recentJob: recentJobList[index],
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )),
        );
      },
    );
  }
}
