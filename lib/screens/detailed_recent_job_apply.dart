import 'package:campus_connect/models/recent_job.dart';
import 'package:campus_connect/provider/theme_dark_light.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailedRecentJobApply extends StatelessWidget {
  final RecentJob job;
  DateTime? selectedDate;
  DetailedRecentJobApply({super.key, required this.job});
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeDarkLight>(
      builder: (context, mode, child) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Image(
                      image: AssetImage('assets/images/Tech_Company.jpg')),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    job.companyName,
                    style: GoogleFonts.poppins(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color:
                            mode.themeDarkMode ? Colors.white : Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    job.jobTitle,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    job.salary,
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 1,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Description',
                        style: GoogleFonts.capriola(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            color: mode.themeDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        job.description,
                        style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'About Role',
                        style: GoogleFonts.capriola(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            color: mode.themeDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        job.aboutRole,
                        style: GoogleFonts.dmSans(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                  const Divider(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Requirements',
                        style: GoogleFonts.capriola(
                            fontSize: 21,
                            fontWeight: FontWeight.w400,
                            color: mode.themeDarkMode
                                ? Colors.white
                                : Colors.black),
                      ),
                    ),
                  ),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: job.requirements.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              job.requirements[index],
                              style: GoogleFonts.dmSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.grey),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: GestureDetector(
            onTap: () {
              showAlertDialog(job.jobTitle, context);
            },
            child: Container(
              alignment: Alignment.center,
              height: 40,
              width: 120,
              decoration: BoxDecoration(
                  color: const Color(0xff003366),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                'Apply Now',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        );
      },
    );
  }

  void showAlertDialog(String jobTitle, BuildContext context) {
    DateTime? picked;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(jobTitle),
          content: Row(
            children: [
              const Text('For confirming Job Pick'),
              const Spacer(),
              IconButton(
                  onPressed: () async {
                    picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2024),
                        lastDate: DateTime(2025));
                  },
                  icon: const Icon(Icons.edit_calendar))
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Confirm'),
              onPressed: () {
                if (picked != null) {
                  selectedDate = picked;
                  Navigator.of(context).pop();
                  showAlertConfirmed(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void showAlertConfirmed(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Applied SuccessFully'),
          content: const Icon(
            Icons.done,
            color: Colors.green,
            size: 40,
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
