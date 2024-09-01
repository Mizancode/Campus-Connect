import "package:campus_connect/models/onboard.dart";
import "package:campus_connect/provider/theme_dark_light.dart";
import "package:campus_connect/screens/auth_screen.dart";
import "package:campus_connect/widget/custom_button.dart";
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:lottie/lottie.dart';
import "package:provider/provider.dart";

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    final control = PageController();
    final list = [
      OnBoard(
          title: 'Discover Opportunities',
          subTitle:
              'Explore thousands of jobs tailored to your skills and aspirations. Connect with top employers right from your campus',
          image: 'assets/lottie/Success.json'),
      OnBoard(
          title: 'Build Your Network',
          subTitle:
              'Connect with professionals, mentors, and peers. Grow your network and unlock career opportunities within your campus community',
          image: 'assets/lottie/Network.json'),
      OnBoard(
          title: 'Land Your Dream Job',
          subTitle:
              'Apply with ease, track your applications, and get closer to securing the perfect job. Start your journey to success today.',
          image: 'assets/lottie/Job_Search.json'),
    ];
    final lastIdx = list.length - 1;
    final size = MediaQuery.of(context).size;
    return Consumer<ThemeDarkLight>(
      builder: (context, mode, child) {
        return Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Auth()));
                    },
                    child: Text(
                      'Skip',
                      style: GoogleFonts.lexend(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: mode.themeDarkMode
                              ? Colors.white
                              : const Color(0xff003366)),
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: SafeArea(
                child: PageView.builder(
                    controller: control,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Lottie.asset(
                            list[index].image,
                            height: size.height / 2,
                          ),
                          Text(
                            list[index].title,
                            style: GoogleFonts.lexend(
                                fontSize: 22,
                                fontWeight: FontWeight.w400,
                                color: mode.themeDarkMode
                                    ? Colors.white
                                    : const Color.fromRGBO(3, 3, 3, 1)),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            list[index].subTitle,
                            style: GoogleFonts.lexend(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: const Color.fromRGBO(123, 123, 123, 1)),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer(),
                          Wrap(
                              spacing: 15,
                              children: List.generate(
                                  list.length,
                                  (i) => Container(
                                        width: i == index ? 25 : 10,
                                        height: 12,
                                        decoration: BoxDecoration(
                                            color: i == index
                                                ? const Color(0xff003366)
                                                : mode.themeDarkMode
                                                    ? Colors.white
                                                    : Colors.grey,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5))),
                                      ))),
                          const Spacer(),
                          CustomBtn(
                            onTap: () {
                              if (index == lastIdx) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Auth()));
                              } else {
                                control.nextPage(
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.ease);
                              }
                            },
                            last: index == lastIdx ? true : false,
                          ),
                          const Spacer(
                            flex: 2,
                          )
                        ],
                      );
                    }),
              ),
            ));
      },
    );
  }
}
