import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';
import 'package:mnblogapp/services/firebase/authetication.dart';
import 'package:mnblogapp/view/home_page.dart';
import 'package:mnblogapp/view/login_page.dart';

class ResgisterPage extends StatefulWidget {
  const ResgisterPage({Key? key}) : super(key: key);

  @override
  State<ResgisterPage> createState() => _ResgisterPageState();
}

class _ResgisterPageState extends State<ResgisterPage> {
  String confirmPassword = "";
  String password = "";
  String email = "";
  String name = "";

  bool isEmailValid = false;
  bool isObsecureText = true;

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
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
                    keyboardType: TextInputType.name,
                    controller: _name,
                    onChanged: (value) {
                      name = value.trimLeft();
                    },
                    cursorColor: themeColor,
                    style: TextStyle(
                      color: darkColor,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.sentiment_satisfied_alt_outlined,
                        color: Colors.grey[400],
                      ),
                      contentPadding: const EdgeInsets.only(top: 15),
                      border: InputBorder.none,
                      hintText: "Name",
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
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
                    controller: _email,
                    onChanged: (value) {
                      email = value.trimLeft();
                      isEmailValid = EmailValidator.validate(email);
                      print(isEmailValid);
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
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: TextFormField(
                    obscureText: isObsecureText,
                    controller: _password,
                    onChanged: (value) {
                      password = value.trimLeft();
                    },
                    cursorColor: themeColor,
                    style: TextStyle(
                      color: darkColor,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: isObsecureText ? Colors.grey[400] : themeColor,
                        ),
                        onPressed: () {
                          setState(() {
                            if (isObsecureText) {
                              isObsecureText = false;
                            } else {
                              isObsecureText = true;
                            }
                          });
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
                    obscureText: isObsecureText,
                    onChanged: (value) {
                      confirmPassword = value.trimLeft();
                    },
                    cursorColor: themeColor,
                    style: TextStyle(
                      color: darkColor,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.security_outlined,
                        color: Colors.grey[400],
                      ),
                      contentPadding: const EdgeInsets.only(top: 15),
                      border: InputBorder.none,
                      hintText: "Confirm Password",
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
                  if (name.isEmpty ||
                      email.isEmpty ||
                      password.isEmpty ||
                      isEmailValid == false ||
                      confirmPassword.isEmpty) {
                    // setState(() {
                    //   _openWarningText = true;
                    // });
                  } else {
                    if (password == confirmPassword) {
                      setState(() {
                        // _openWarningText = false;
                        // isProgress = true;
                      });
                    }
                  }
                  var value = signUp(email, password);
                  if (value == 'weak') {
                    setState(() {
                      // isProgress = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: themeColor,
                        content: const Text(
                          'The account already exists for that email.',
                        ),
                      ),
                    );
                  }
                  // Navigator.push(
                  //   context,
                  //   CupertinoPageRoute(
                  //     builder: (context) => const HomePage(),
                  //   ),
                  // );
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                  child: Text(
                    "Click to Sign-Up",
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
                    "Already have an account? ",
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
                          builder: (context) => const LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Log In Here",
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
