import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnblogapp/constants.dart';
import 'package:mnblogapp/customWidgets/blog_display_card.dart';
import 'package:mnblogapp/services/firebase/authetication.dart';
import 'package:mnblogapp/services/firebase/firestore.dart';
import 'package:mnblogapp/view/get_started_page.dart';
import 'package:mnblogapp/view/profile_page.dart';
import 'package:mnblogapp/view/read_page.dart';
import 'package:mnblogapp/view/search_page.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isFilter = false;
  bool isMovie = false;

  signOut() async {
    await signOutFromFirebase();
    print('logout');
    setState(() {});
  }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return !userIsLogedIn
        ? const GetStartedPage()
        : Scaffold(
            drawer: Drawer(
              child: Center(
                child: ListTile(
                  onTap: () {
                    signOut();
                  },
                  leading: const Icon(Icons.logout),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            backgroundColor: lightColor,

            //--------------------app_bar---------------//

            appBar: AppBar(
              backgroundColor: lightColor,
              iconTheme: IconThemeData(
                color: darkColor,
              ),
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (ctx) => const ProfilePage(),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.circle,
                      color: darkColor,
                      size: 45,
                    ),
                  ),
                ),
              ],
            ),

            //---------------------------------------------//

            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Blogs',
                      style: TextStyle(
                        color: darkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    isFilter
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isMovie = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color:
                                        isMovie ? themeColor : Colors.grey[100],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text(
                                      'Movies',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color:
                                            isMovie ? lightColor : Colors.grey,
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
                                    color:
                                        isMovie ? Colors.grey[100] : themeColor,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(14.0),
                                    child: Text(
                                      'Sports',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color:
                                            isMovie ? Colors.grey : lightColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    isFilter = false;
                                  });
                                },
                                icon: const Icon(Icons.cancel),
                              )
                            ],
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const SearchPage(),
                                ),
                              );
                            },
                            child: Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.search),
                                          Text(
                                            "  Search by Name / Email",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            isFilter = true;
                                          });
                                        },
                                        icon: const Icon(
                                            Icons.filter_alt_outlined),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                    const SizedBox(
                      height: 20,
                    ),

//------------------------//

                    isFilter
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height * 0.64,
                            // color: Colors.amber,
                            child: PaginateFirestore(
                              // header: const SliverToBoxAdapter(
                              //   child: Text('Latest Blogs'),
                              // ),

                              //item builder type is compulsory.
                              itemBuilder: (context, documentSnapshots, index) {
                                final data =
                                    documentSnapshots[index].data() as Map?;
                                return BlogDisplayCard(
                                  title: data!['title'],
                                  desc: data['description'],
                                  blogername: data['full_name'],
                                  imageUrl: data['thumbnailUrls'],
                                );
                              },
                              // orderBy is compulsory to enable pagination
                              query: FirebaseFirestore.instance
                                  .collection('blogs')
                                  .orderBy('serverTimestamp', descending: true)
                                  .where('isMovie', isEqualTo: true),
                              //Change types accordingly
                              itemBuilderType: PaginateBuilderType.listView,
                              // to fetch real-time data
                              isLive: true,
                            ),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height * 0.64,
                            // color: Colors.amber,
                            child: PaginateFirestore(
                              // header: const SliverToBoxAdapter(
                              //   child: Text('Latest Blogs'),
                              // ),

                              //item builder type is compulsory.
                              onEmpty: const Center(
                                child: Text("No Blogs Yet"),
                              ),
                              itemBuilder: (context, documentSnapshots, index) {
                                final data =
                                    documentSnapshots[index].data() as Map?;
                                return BlogDisplayCard(
                                  title: data!['title'],
                                  desc: data['description'],
                                  blogername: data['full_name'],
                                  imageUrl: data['thumbnailUrls'],
                                );
                              },
                              // orderBy is compulsory to enable pagination
                              query: FirebaseFirestore.instance
                                  .collection('blogs')
                                  .orderBy('serverTimestamp', descending: true),
                              //Change types accordingly
                              itemBuilderType: PaginateBuilderType.listView,
                              // to fetch real-time data
                              isLive: true,
                            ),
                          ),

                    //------------------
                  ],
                ),
              ),
            ),
          );
  }
}
