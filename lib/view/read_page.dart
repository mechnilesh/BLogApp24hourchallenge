import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';

class ReadBlogPage extends StatelessWidget {
  const ReadBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: lightColor,
        elevation: 0,
        iconTheme: IconThemeData(
          color: darkColor, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 170.0, right: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[100],
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.bookmark_outline_rounded,
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: const [
                  Text(
                    "By ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "kelly Pefer",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'How to become master in colour palette?',
                style: TextStyle(
                  color: darkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '''Paragraphs vary in length depending on the needs of the paragraph. Usually, paragraphs are between one-third and two-thirds of a page double spaced.

A series of long paragraphs can make prose dense and unpleasant to read. Check any paragraph that is a page or longer to see whether it would work better as two or more paragraphs. Break it at a logical place (e.g., where your focus shifts), and see whether you need to create new topic sentences to make the shift clear.

Also look out for short paragraphs only two or three sentences long. They make academic writing seem disjointed or skimpy. Try combining short paragraphs with the preceding or following paragraph if they share the same topic. Short paragraphs might also need to be developed further. Make sure that nothing vital has been omitted.''',
                style: TextStyle(
                  color: Colors.grey[600],
                  // fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
