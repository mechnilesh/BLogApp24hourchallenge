import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';
import 'package:mnblogapp/services/firebase/authetication.dart';
import 'package:mnblogapp/view/register_page.dart';

import 'home_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = "";
  String email = "";

  bool isEmailValid = false;
  bool isObsecureText = true;
  bool isLoading = false;

  final _email = TextEditingController();
  final _password = TextEditingController();

  logIn(String email, String password) async {
    await logInToFirebase(email, password);
    if (userIsLogedIn) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomePage()),
          (Route<dynamic> route) => false);
    } else if (isSnackBar) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: themeColor,
          content: Text((sentence == 1)
              ? 'No user found for that email.'
              : 'Wrong password provided for that user.'),
        ),
      );
    }
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
                    controller: _email,
                    onChanged: (value) {
                      email = value.trimLeft();
                      isEmailValid = EmailValidator.validate(email);
                      // print(isEmailValid);
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
              const SizedBox(
                height: 40,
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : TextButton(
                      onPressed: () {
                        if (email.isEmpty ||
                            password.isEmpty ||
                            isEmailValid == false) {
                          // setState(() {
                          //   _openWarningText = true;
                          // });
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          logIn(email, password);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 25),
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
