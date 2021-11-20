// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';
import 'package:mnblogapp/view/get_started_page.dart';
import 'package:mnblogapp/view/profile_page.dart';
import 'package:mnblogapp/view/read_page.dart';
import 'package:mnblogapp/view/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: lightColor,

      //--------------------app_bar---------------//

      appBar: AppBar(
        backgroundColor: lightColor,
        iconTheme: IconThemeData(
          color: darkColor, //change your color here
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (ctx) => const ProfilePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.circle,
                color: darkColor,
                size: 45,
              ),
            ),
          ),
        ],
      ),

      //---------------------------------------------//

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Blogs',
                style: TextStyle(
                  color: darkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SearchPage(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.search),
                              Text(
                                "  Search by Name / Email",
                                style:
                                    TextStyle(fontSize: 17, color: Colors.grey),
                              ),
                            ],
                          ),
                          const Icon(Icons.filter_alt_outlined),
                        ],
                      ),
                    ),
                  ),

                  // child: TextField(
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       CupertinoPageRoute(
                  //         builder: (context) => const ReadBlogPage(),
                  //       ),
                  //     );
                  //   },
                  //   decoration: InputDecoration(
                  //     hintStyle: TextStyle(fontSize: 17),
                  //     hintText: 'Search by Name / Email',
                  //     suffixIcon: Icon(Icons.filter_alt_outlined),
                  //     prefixIcon: Icon(Icons.search),
                  //     border: InputBorder.none,
                  //     contentPadding: EdgeInsets.all(20),
                  //   ),
                  // ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  // print('tt');
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const ReadBlogPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          height: 18,
                          // width: 18,
                          decoration: BoxDecoration(
                            color: lightColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Text(
                              '  5 Feb  ',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                    Column(
                      children: [
                        SizedBox(
                          // height: MediaQuery.of(context).size.width * 0.1,
                          // color: Colors.orange,
                          width: MediaQuery.of(context).size.width * 0.48,
                          child: const Text(
                            '5 min read',
                            style: TextStyle(
                              color: Colors.grey,
                              // fontWeight: FontWeight.bold,
                              // fontSize: 28,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.1,
                          // color: Colors.green,
                          width: MediaQuery.of(context).size.width * 0.48,
                          child: Text(
                            'Make design systems people want to use.',
                            style: TextStyle(
                              color: darkColor,
                              fontWeight: FontWeight.bold,
                              // fontSize: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
