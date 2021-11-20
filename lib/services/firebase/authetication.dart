import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
// final String currentuserId = auth.currentUser.uid;
bool userIsLogedIn = false;
bool? status;

Future<void> checkUserStatus() async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}

Future<String> signUp(String email, String password) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
      return 'weak';

      // setState(() {
      //   isProgress = false;
      // });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     backgroundColor: pinkColor,
      //     content: Text('The password provided is too weak or empty'),
      //   ),
      // );
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      return 'use';

      // setState(() {
      //   isProgress = false;
      // });
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     backgroundColor: pinkColor,
      //     content: Text(
      //       'The account already exists for that email.',
      //     ),
      //   ),
      // );
    }
  } catch (e) {
    print(e);
  }
  return 'null';
}
