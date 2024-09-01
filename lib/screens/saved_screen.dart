import 'package:campus_connect/provider/saved_provider.dart';
import 'package:campus_connect/provider/theme_dark_light.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Saved extends StatelessWidget {
  const Saved({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<SavedProvider>(
        builder: (context, value, child) {
          return value.list.isEmpty
              ? Center(
                  child: Text(
                  'Saved',
                  style: GoogleFonts.poppins(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ))
              : ListView.builder(
                  itemCount: value.list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        shape: const StadiumBorder(),
                        child: ListTile(
                          leading: const Icon(Icons.business),
                          title: Text(
                            value.list[index]['companyName'],
                            style: GoogleFonts.lexend(),
                          ),
                          subtitle: Text(
                            value.list[index]['jobTitle'],
                            style: GoogleFonts.lexend(color: Colors.grey),
                          ),
                          trailing: Consumer<ThemeDarkLight>(
                            builder: (context, mode, child) {
                              return IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: mode.themeDarkMode
                                      ? Colors.white
                                      : const Color(0xff003366),
                                ),
                                onPressed: () {
                                  value.remove(value.list[index]);
                                },
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  });
        },
      ),
    ));
  }
}
