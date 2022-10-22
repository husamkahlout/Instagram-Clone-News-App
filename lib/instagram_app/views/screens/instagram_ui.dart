
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_ui/instagram_app/views/widgets/postwidget.dart';
import 'package:instagram_ui/instagram_app/views/widgets/storywidget.dart';
import '../../data/dummyData.dart';
import '../../views/widgets/customLandScope.dart';

class instegramUi extends StatelessWidget {
  final topBar = AppBar(
    iconTheme: IconThemeData(color: Colors.black),
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 1.0,
    // leading: const Icon(
    //   Icons.camera_alt,
    //   color: Colors.black,
    // ),
    title: const SizedBox(
        height: 35.0,
        ),
    actions: const <Widget>[
      Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(
          Icons.send,
          color: Colors.black,
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      drawer: orientation == Orientation.landscape
          ? null
          : Drawer(
              child: Column(
                children: const [
                  UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        child: Text('o'),
                      ),
                      accountName: Text('Husam Kahlout'),
                      accountEmail: Text('husamkahlout99@gmail.com')),
                  ListTile(
                    subtitle: Text('Go to heme'),
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
      appBar: topBar,
      body: orientation == Orientation.landscape
          ? CustomLandScope()
          : Column(children: [
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
                              backgroundImage:
                                  NetworkImage(posts[index].user?.image ?? ''),
                              radius: 30,
                              backgroundColor: Colors.blue,
                              child: Align(
                                alignment: Alignment.center,
                                child: const Icon(Icons.add )),
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
                    return PostWidget(posts[index].user!, posts[index].post!);
                  },
                  //   children: posts.map((e) {
                  // return PostFeed(e.user!, e.post!);
                  // }).toList(),
                ),
              ),
            ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.black,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.subscriptions,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}