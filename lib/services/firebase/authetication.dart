import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
final String currentuserId = auth.currentUser!.uid;

bool userIsLogedIn = false;
bool? status;
int sentence = 0;
bool isSnackBar = false;

//-------------------user_login_status

Future<void> authStatus() async {
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      userIsLogedIn = true;
      print('User is signed in!');
      // print(auth.currentUser!.uid);
    }
  });
}

//--------------------signup_user

Future<void> signUptoFirebase(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => {
              userIsLogedIn = true,
              print(userIsLogedIn),
              print("user created"),
            });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      // print('The password provided is too weak.');
      isSnackBar = true;
      sentence = 1;
    } else if (e.code == 'email-already-in-use') {
      isSnackBar = true;
      // print('The account already exists for that email.');
    }
  } catch (e) {
    // print(e); Do not use print in production code
  }
}

//---------------------log_in_user

Future<void> logInToFirebase(String email, String password) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => {
              userIsLogedIn = true,
              print(userIsLogedIn),
              print("user loged in"),
            });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      // print('No user found for that email.');
      sentence = 1;
      isSnackBar = true;
    } else if (e.code == 'wrong-password') {
      // print('Wrong password provided for that user.');
      isSnackBar = true;
    }
  }
}

//----------------------log_out_user

signOutFromFirebase() {
  auth.signOut().then(
        (value) => userIsLogedIn = false,
      );
}
