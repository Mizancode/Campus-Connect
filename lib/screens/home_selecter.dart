import 'package:campus_connect/screens/home_screen.dart';
import 'package:campus_connect/screens/message_screen.dart';
import 'package:campus_connect/screens/saved_screen.dart';
import 'package:flutter/material.dart';

class HomeSelecter extends StatefulWidget {
  final String name;
  final String domain;
  const HomeSelecter({super.key, required this.name, required this.domain});

  @override
  State<HomeSelecter> createState() => _HomeSelecterState();
}

class _HomeSelecterState extends State<HomeSelecter> {
  int myIndex = 1;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Message(),
      Home(
        name: widget.name,
        domain: widget.domain,
      ),
      const Saved()
    ];
    return Scaffold(
      body: list[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          myIndex = value;
          setState(() {});
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_outlined), label: 'Saved'),
        ],
      ),
    );
  }
}
