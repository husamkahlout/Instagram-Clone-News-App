

import 'package:instagram_ui/instagram_app/models/post.dart';
import 'package:instagram_ui/instagram_app/models/user.dart';
class PostsResponse {
  User? user;
  Post? post;
  PostsResponse.fromJson(Map<String, dynamic> data) {
    user = User.fromJson(data['user']);
    post = Post.fromJson(data['post']);
  }
}
