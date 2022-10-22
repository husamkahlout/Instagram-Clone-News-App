class Post {
  String? content;
  String? image;
  int? numLikes;

  Post(this.content, this.image,this.numLikes);

  Post.fromJson(Map<String, dynamic> data) {
    content = data["content"];
    image = data["image"];
    numLikes = data["noLikes"];
  }
}
