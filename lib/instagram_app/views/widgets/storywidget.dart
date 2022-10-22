
// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../models/user.dart';


class StoryWidget extends StatelessWidget {
  //Post post;
  User user;
  StoryWidget(this.user, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.red,
        backgroundImage: NetworkImage(user.image!),
      ),
    );
  }
}