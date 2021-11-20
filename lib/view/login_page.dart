import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';
import 'package:mnblogapp/view/register_page.dart';

import 'home_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // bool clickedLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              //
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: themeColor,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    // controller: _name,
                    onChanged: (value) {
                      // this.name = value.trimLeft();
                    },
                    cursorColor: themeColor,
                    style: TextStyle(
                      color: darkColor,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.alternate_email_sharp,
                        color: Colors.grey[400],
                      ),
                      contentPadding: const EdgeInsets.only(top: 15),
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: Colors.grey,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextFormField(
                    // obscureText: obsecureText,
                    // controller: _password,
                    onChanged: (value) {
                      // this.password = value.trimLeft();
                    },
                    cursorColor: themeColor,
                    style: TextStyle(
                      color: darkColor,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(
                          Icons.remove_red_eye_outlined,
                          // color: obsecureText ? Colors.grey[400] : pinkColor,
                        ),
                        onPressed: () {
                          // setState(() {
                          //   if (obsecureText) {
                          //     obsecureText = false;
                          //   } else {
                          //     obsecureText = true;
                          //   }
                          // });
                        },
                      ),
                      prefixIcon: Icon(
                        Icons.security_outlined,
                        color: Colors.grey[400],
                      ),
                      contentPadding: const EdgeInsets.only(top: 15),
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Text(
                    "Click to Log-In",
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
                    "Don't Have An Account? ",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ResgisterPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up Here",
                      style: TextStyle(
                        color: darkColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
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
