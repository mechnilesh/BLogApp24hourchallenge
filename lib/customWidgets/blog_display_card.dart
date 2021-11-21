import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';
import 'package:mnblogapp/view/read_page.dart';

class BlogDisplayCard extends StatelessWidget {
  const BlogDisplayCard({
    Key? key,
    required this.title,
    required this.desc,
    required this.blogername,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String desc;
  final String blogername;
  final List imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => ReadBlogPage(
              title: title,
              desc: desc,
              blogername: blogername,
              imageUrl: imageUrl,
              key: key,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 40,
                      width: 40,
                      // color: Colors.,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            themeColor,
                            // Colors.grey[100],
                            Colors.white
                          ],
                        ),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: imageUrl[0].toString(),
                  ),
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
                  child: Text(
                    title,
                    style: const TextStyle(
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
                  height: 34,
                  // color: Colors.green,
                  width: MediaQuery.of(context).size.width * 0.48,
                  child: Text(
                    desc,
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
      ),
    );
  }
}
