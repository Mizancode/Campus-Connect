import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback onTap;
  final bool last;
  const CustomBtn({super.key, required this.onTap, required this.last});

  @override
  Widget build(BuildContext context) {
    return Align(
        child: InkWell(
      onTap: onTap,
      child: Container(
        height: last ? 70 : 70,
        width: last ? 200 : 70,
        decoration: BoxDecoration(
            color: const Color(0xaa003366),
            borderRadius: BorderRadius.circular(last ? 100 : 35)),
        child: last
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Get Started',
                    style: GoogleFonts.lexend(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: const BoxDecoration(
                            color: Color(0xff003366), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ],
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                        color: Color(0xff003366), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 35,
                    ),
                  )
                ],
              ),
      ),
    ));
  }
}
