import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Search extends StatelessWidget {
  const Search({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: 'Search',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            SizedBox(
              height: size.height * 0.15,
            ),
            Lottie.asset('assets/lottie/Searching.json',
                height: size.height * 0.3),
          ],
        ),
      ),
    ));
  }
}
