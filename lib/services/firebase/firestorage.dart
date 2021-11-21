import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> uploadThumnail(List thumbNailImage, List thumbNailUrl) async {
  for (var thumnNailImageFile in thumbNailImage) {
    var downloadUrlThumbnail = await postThumbnailImage(thumnNailImageFile);
    thumbNailUrl.add(downloadUrlThumbnail.toString());
  }
}

Future<dynamic> postThumbnailImage(Asset thumbNailImageFile) async {
  String fileName = DateTime.now().millisecondsSinceEpoch.toString();

  firebase_storage.Reference storageRef = firebase_storage
      .FirebaseStorage.instance
      .ref()
      .child('BlogImages/$fileName');

  firebase_storage.UploadTask uploadTask = storageRef
      .putData((await thumbNailImageFile.getByteData()).buffer.asUint8List());

  firebase_storage.TaskSnapshot storageTaskSnapshot =
      await uploadTask.whenComplete(() {});
  return storageTaskSnapshot.ref.getDownloadURL();
}
