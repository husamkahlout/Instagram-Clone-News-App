import 'package:flutter/material.dart';
import 'package:instagram_ui/instagram_app/data/dummyData.dart';
import 'package:instagram_ui/instagram_app/views/widgets/postwidget.dart';
import 'package:instagram_ui/instagram_app/views/widgets/storywidget.dart';
// import '../widget/storywidget.dart';
class CustomLandScope extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: SingleChildScrollView(
              scrollDirection:Axis.vertical ,
              child: Column(
                children: const [
                  UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        child: Text('o'),
                      ),
                      accountName: Text('Husam Kahlout'),
                      accountEmail: Text('husamkahlout99@gmail.com')),
                  ListTile(
                    subtitle: Text('Go to home'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                  ),
                  ListTile(
                    subtitle: Text('Go to favorite'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: Icon(Icons.favorite),
                    title: Text('Favorite'),
                  ),
                  ListTile(
                    subtitle: Text('Go to Profile'),
                    trailing: Icon(Icons.arrow_forward_ios),
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: posts.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == 0) {
                              return CircleAvatar(
                                backgroundImage: NetworkImage(
                                    posts[index].user?.image ?? ''),
                                radius: 30,
                                backgroundColor: Colors.blue,
                                child: Icon(Icons.add),
                              );
                            }
                            return StoryWidget(posts[index].user!);
                          },
                        ),

                        //////////////////////////
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return PostWidget(
                          posts[index].user!, posts[index].post!);
                    },
                    //   children: posts.map((e) {
                    // return PostFeed(e.user!, e.post!);
                    // }).toList(),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}