import 'package:campus_connect/models/chating_message.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final messageController = TextEditingController();
  List<String> list = [];

  void displayMessage(String message) {
    list.add(message);
    messageController.clear();
    setState(() {});
    Future.delayed(const Duration(milliseconds: 800), () {
      setState(() {});
      list.add(ChatMessage.getMessage(message));
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xaa4169E1),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            list.isNotEmpty
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 10),
                      child: ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (context, index) {
                          return Column(
                              crossAxisAlignment: index.isEven
                                  ? CrossAxisAlignment.start
                                  : CrossAxisAlignment.end,
                              children: [
                                index.isEven
                                    ? Container(
                                        margin: const EdgeInsets.all(4),
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.green.shade100,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                        child: Text(
                                          list[index],
                                          style: GoogleFonts.lexend(
                                              color: Colors.black,
                                              fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                                    : Container(
                                        margin: const EdgeInsets.all(4),
                                        padding: const EdgeInsets.all(3),
                                        decoration: BoxDecoration(
                                            color: Colors.red.shade100,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomLeft:
                                                        Radius.circular(10))),
                                        child: Text(
                                          list[index],
                                          style: GoogleFonts.lexend(
                                              color: Colors.black,
                                              fontSize: 15),
                                          textAlign: TextAlign.center,
                                        ),
                                      )
                              ]);
                        },
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Center(
                            child: Lottie.asset(
                          'assets/lottie/Message_Loader.json',
                        ));
                      },
                    ),
                  ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: size.width * 0.75,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.face,
                            color: Colors.black,
                          )),
                      Expanded(
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          controller: messageController,
                          decoration: const InputDecoration(
                              hintText: 'Message',
                              hintStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                      const Icon(
                        Icons.image,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      displayMessage(messageController.text);
                    },
                    icon: const Icon(
                      Icons.send,
                      size: 40,
                      color: Colors.black,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
