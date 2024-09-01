import 'package:campus_connect/models/job.dart';
import 'package:campus_connect/screens/detailed_recommend_job_apply_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RecommendJob extends StatelessWidget {
  final Job job;
  const RecommendJob({super.key, required this.job});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: (200 / size.height) * size.height,
      width: (270 / size.width) * size.width,
      decoration: BoxDecoration(
        color: const Color(0xffE5E4E2),
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
                  job.imageUrl.toString(),
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
                job.jobTitle,
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
                job.companyName,
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
              color: Colors.deepPurple.shade100,
              child: Text(
                job.salary,
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
              left: 70,
              bottom: 30,
              child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 90,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent.shade100,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    job.type,
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ))),
          Positioned(
              right: 10,
              bottom: 33,
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailedRecommendJobApply(job: job))),
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
  }
}
