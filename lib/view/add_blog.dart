import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/model/blog_post.dart';
import 'package:mnblogapp/model/user.dart';
import 'package:mnblogapp/services/firebase/authetication.dart';
import 'package:mnblogapp/services/firebase/firestorage.dart';
import 'package:mnblogapp/services/firebase/firestore.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../constants.dart';

class AddBlogPage extends StatefulWidget {
  const AddBlogPage({Key? key}) : super(key: key);

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();

  bool isUploadClicked = false;
  bool isLoading = false;
  bool enablePop = true;
  bool isMovie = true;

  List<Asset> thumbNailImage = <Asset>[];
  List<String> thumNailUrl = <String>[];

  //-------------------------ThumnNailImagePicker-----------------//

  Widget buildThumbnailView() {
    return GridView.count(
      crossAxisCount: 1,
      // childAspectRatio: 1,
      scrollDirection: Axis.horizontal,
      children: List.generate(
        thumbNailImage.length,
        (index) {
          Asset asset = thumbNailImage[index];
          return Padding(
            padding: const EdgeInsets.all(1.0),
            child: AssetThumb(
              asset: asset,
              height: 300,
              width: 300,
            ),
          );
        },
      ),
    );
  }

  Future<void> loadThumnailAsset() async {
    List<Asset> resultThumnailList = <Asset>[];
    // String error = 'No Error Detected';

    try {
      resultThumnailList = await MultiImagePicker.pickImages(
        maxImages: 01,
        enableCamera: false,
        selectedAssets: thumbNailImage,
        cupertinoOptions: const CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: const MaterialOptions(
          actionBarColor: "#08b1bd",
          actionBarTitle: "Select photo",
          actionBarTitleColor: "#ffffff",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#ffffff",
          statusBarColor: "#08b1bd",
          // backButtonDrawable: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      thumbNailImage = resultThumnailList;
      // _error = error;
    });
  }

  //-------------------------upload_function--------------------------//

  uploadBlog() async {
    await uploadThumnail(thumbNailImage, thumNailUrl);
    await addBlog(
      userClass.name,
      currentuserId,
      userClass.email,
      blog.title,
      blog.desc,
      thumNailUrl,
      isMovie,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: themeColor,
        content: const Text('Published successfully'),
      ),
    );
    setState(() {
      thumNailUrl.clear();
      enablePop = true;
    });
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }

  //---------------------------BODY----------------------------------//

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => enablePop,
      child: Scaffold(
        backgroundColor: lightColor,
        appBar: AppBar(
          backgroundColor: lightColor,
          elevation: 0,
          iconTheme: IconThemeData(
            color: darkColor, //change your color here
          ),
          actions: [
            (thumbNailImage.isEmpty ||
                    _titleController.value.text.isEmpty ||
                    _desController.value.text.isEmpty)
                ? Container()
                : isLoading
                    ? const Padding(
                        padding: EdgeInsets.only(right: 18.0),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            enablePop = false;
                            isUploadClicked = true;
                            isLoading = true;
                          });
                          uploadBlog();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Center(
                            child: Text(
                              "POST",
                              style: TextStyle(
                                color: themeColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                thumbNailImage.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            height: 150,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14.0),
                              child: buildThumbnailView(),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                thumbNailImage.clear();
                              });
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(
                                color: themeColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: IconButton(
                          onPressed: () {
                            loadThumnailAsset();
                          },
                          icon: const Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 34,
                            // color: Colors.white,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    onChanged: (text) {
                      blog.title = text;
                    },
                    controller: _titleController,
                    cursorColor: themeColor,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Title Here',
                      // suffixIcon: Icon(Icons.filter_alt_outlined),
                      // prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    onChanged: (text) {
                      blog.desc = text;
                    },
                    controller: _desController,
                    cursorColor: themeColor,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Write Blog Here',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'Change Category :',
                      style: TextStyle(fontSize: 17),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMovie = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMovie ? themeColor : Colors.grey[100],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            'Movies',
                            style: TextStyle(
                              fontSize: 17,
                              color: isMovie ? lightColor : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isMovie = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isMovie ? Colors.grey[100] : themeColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Text(
                            'Sports',
                            style: TextStyle(
                              fontSize: 17,
                              color: isMovie ? Colors.grey : lightColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
