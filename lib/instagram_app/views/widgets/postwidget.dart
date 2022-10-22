import 'package:flutter/material.dart';
import 'package:instagram_ui/instagram_app/models/post.dart';
import 'package:instagram_ui/instagram_app/models/user.dart';



class PostWidget extends StatelessWidget {
  User user;
  Post post;
  PostWidget(this.user, this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  user.image ?? '',
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                user.name ?? '',
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.verified,
                color: Colors.blue,
                size: 18,
              ),
              const Spacer(),
              const Icon(Icons.more_horiz),
            ],
          ),
        ),
        Column(
          children: [
            Container(
              width: 400,
              height: 400,
              child: Image.network(
                post.image ?? '',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 30, top: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  Image.asset(
                    "assets/icons/heart.png",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/icons/chat-bubble.png",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    "assets/icons/send.png",
                    width: 24,
                    height: 24,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 20, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Liked by ",
                  ),
                  Text(
                    user.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    " and ${post.numLikes} others",
                    style: const TextStyle(),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 0, right: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      post.content ?? '',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}