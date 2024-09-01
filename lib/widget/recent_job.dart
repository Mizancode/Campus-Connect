import 'package:campus_connect/models/recent_job.dart';
import 'package:campus_connect/provider/saved_provider.dart';
import 'package:campus_connect/screens/detailed_recent_job_apply.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RecentJobs extends StatelessWidget {
  final RecentJob recentJob;
  const RecentJobs({super.key, required this.recentJob});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<SavedProvider>(builder: (context, value, child) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: (200 / size.height) * size.height,
        width: (300 / size.width) * size.width,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Positioned(
                left: 10,
                top: 10,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset(
                    recentJob.imageUrl.toString(),
                  ),
                )),
            Positioned(
              left: 80,
              top: 20,
              child: SizedBox(
                width: size.width * 0.53,
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  recentJob.jobTitle,
                  style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 50,
              child: SizedBox(
                width: size.width * 0.53,
                child: Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  recentJob.companyName,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: 90,
              child: Container(
                color: Colors.orange.shade100,
                child: Text(
                  recentJob.salary,
                  style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
                left: 80,
                bottom: 30,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      recentJob.type,
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ))),
            Positioned(
                right: 0,
                top: 10,
                child: IconButton(
                    onPressed: () {
                      Map<String, dynamic> jobMap = {
                        'jobTitle': recentJob.jobTitle,
                        'companyName': recentJob.companyName,
                        'salary': recentJob.salary,
                        'postDate': recentJob.postDate,
                        'description': recentJob.description,
                        'aboutRole': recentJob.aboutRole,
                        'requirements': recentJob.requirements,
                        'imageUrl': recentJob.imageUrl,
                      };
                      if (value.list.contains(jobMap)) {
                        value.remove(jobMap);
                      } else {
                        value.add(jobMap);
                      }
                    },
                    icon: const Icon(
                      Icons.bookmark_border_outlined,
                      size: 35,
                      color: Colors.black,
                    ))),
            Positioned(
                right: 10,
                bottom: 33,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailedRecentJobApply(job: recentJob))),
                  child: Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 90,
                      decoration: BoxDecoration(
                        color: const Color(0xff008080),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'Apply Now',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      )),
                ))
          ],
        ),
      );
    });
  }
}
