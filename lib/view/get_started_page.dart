import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';
import 'package:mnblogapp/services/firebase/authetication.dart';
import 'package:mnblogapp/view/home_page.dart';
import 'package:mnblogapp/view/login_page.dart';
import 'package:mnblogapp/view/register_page.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  void initState() {
    checkUserStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return userIsLogedIn
        ? const HomePage()
        : Scaffold(
            backgroundColor: lightColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // width: MediaQuery.of(context).size.width * 0.8,
                  Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Publish Your \nPassion in Own Way \nIt's free",
                    style: TextStyle(
                      color: darkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const ResgisterPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 25),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              color: lightColor,
                              // fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: themeColor,
                          shape: const StadiumBorder(),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 25,
                          ),
                          child: Text(
                            "  Login  ",
                            style: TextStyle(
                              color: darkColor,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          // backgroundColor: themeColor,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.grey[300],
                      ),
                      Text(
                        "Continue with ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 15,
                        ),
                      ),
                      GestureDetector(
                        child: Text(
                          "Google",
                          style: TextStyle(
                            color: darkColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          );
  }
}
