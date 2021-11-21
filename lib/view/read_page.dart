import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';

class ReadBlogPage extends StatelessWidget {
  const ReadBlogPage({
    Key? key,
    required this.title,
    required this.desc,
    required this.blogername,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String desc;
  final String blogername;
  final List imageUrl;

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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: 40,
                          width: 40,
                          // color: Colors.,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                themeColor,
                                // Colors.grey[100],
                                Colors.white
                              ],
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                        imageUrl: imageUrl[0].toString(),
                      ),
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
                children: [
                  const Text(
                    "By ",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    blogername,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                title,
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
                desc,
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
