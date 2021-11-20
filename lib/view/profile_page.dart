import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';
import 'package:mnblogapp/view/add_blog.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: lightColor,
        iconTheme: IconThemeData(
          color: darkColor, //change your color here
        ),
        // title: Text(
        //   "PROFILE",
        //   style: TextStyle(color: darkColor),
        // ),
        // centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (ctx) => const AddBlogPage(),
            ),
          );
        },
        child: Container(
          width: 120,
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            color: Colors.grey[400],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Add  Blog  ",
                style: TextStyle(
                  color: lightColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.post_add,
                color: lightColor,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      color: themeColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        'Nilesh Kumar Singh'.toUpperCase(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        'Flutter Developer',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 45,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'about me'.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 16,
                    ),
                  ),
                  Divider(
                    color: themeColor,
                    endIndent: 300,
                    thickness: 2,
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  const Text(
                    '''A paragraph is a self-contained unit of discourse in writing dealing with a particular point or idea. A paragraph consists of one or more sentences. Though not required by the syntax of any language, ''',
                    style: TextStyle(
                      color: Colors.grey,
                      // fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
