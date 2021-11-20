import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/view/read_page.dart';

import '../constants.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      appBar: AppBar(
        backgroundColor: lightColor,
        titleSpacing: 0.0,
        iconTheme: IconThemeData(
          color: darkColor, //change your color here
        ),
        elevation: 0,
        title: TextField(
          autofocus: true,
          onTap: () {
            // Navigator.push(
            //   context,
            //   CupertinoPageRoute(
            //     builder: (context) => const ReadBlogPage(),
            //   ),
            // );
          },
          decoration: const InputDecoration(
            hintStyle: TextStyle(fontSize: 17),
            hintText: 'Search by Name / Email',
            suffixIcon: Icon(Icons.search),

            // prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
             Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeColor,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05,
                          // color: Colors.orange,
                          width: MediaQuery.of(context).size.width * 0.72,
                          child: const Text(
                            'Nilesh Kumar Singh',
                            style: TextStyle(
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05,
                          // color: Colors.green,
                          width: MediaQuery.of(context).size.width * 0.72,
                          child: Text(
                            'nilesh2001nk@gmail.com',
                            style: TextStyle(
                              color: darkColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: themeColor,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05,
                          // color: Colors.orange,
                          width: MediaQuery.of(context).size.width * 0.72,
                          child: const Text(
                            'Nilesh Kumar Singh',
                            style: TextStyle(
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.05,
                          // color: Colors.green,
                          width: MediaQuery.of(context).size.width * 0.72,
                          child: Text(
                            'nilesh2001nk@gmail.com',
                            style: TextStyle(
                              color: darkColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
