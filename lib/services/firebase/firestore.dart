import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mnblogapp/model/user.dart';
import 'package:mnblogapp/services/firebase/authetication.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> addUserInFirestore(String name, String email) {
  return users
      .doc(currentuserId)
      .set({
        'full_name': name,
        'about': '',
        'title': '',
        'uid': currentuserId,
        'email': email,
      })
      .then((value) => print("User Added in firestore"))
      .catchError((error) => print("Failed to add user: $error"));
}

Future<void> getUserData() async {
  return firestore
      .collection('users')
      .where('uid', isEqualTo: currentuserId)
      .get()
      .then(
        (QuerySnapshot querySnapshot) => {
          querySnapshot.docs.forEach(
            (doc) {
              userClass.name = doc['full_name'];
              userClass.title = doc['title'];
              userClass.about = doc['about'];
              userClass.email = doc['email'];

              print(doc['full_name']);
              print(doc['title']);
              print(doc['about']);
              print(doc['email']);
            },
          )
        },
      );
}

//---------------------------------AddBlogTOFirestore------------------------//

Future<DocumentReference> addBlog(
  String name,
  String uid,
  String email,
  String title,
  String description,
  List<String> thumbnails,
  bool isMovie,
) {
  CollectionReference blogs = FirebaseFirestore.instance.collection('blogs');
  return blogs.add({
    'full_name': name,
    'uid': uid,
    'email': email,
    'title': title,
    'description': description,
    'thumbnailUrls': thumbnails,
    'serverTimestamp': FieldValue.serverTimestamp(),
    'isMovie': isMovie,
    // 'likedBy': ['demo@gmail.com'],
  }).then((value) {
    return value;
    // ignore: return_of_invalid_type_from_catch_error
  }).catchError((error) => print("Failed to add blog: $error"));
}


//------------------------FetchBlogsFromFirestore---------------------------//

