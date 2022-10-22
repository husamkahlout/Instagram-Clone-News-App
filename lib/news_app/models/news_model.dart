class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? content;
  String? imgUrl;
  String? publishedAt;
  bool isLike = false;
  Source? source;

  NewsModel.fromJson(Map<String, dynamic> map) {
    author = map["author"];
    title = map["title"];
    description = map["description"];
    url = map["url"];
    content = map["content"];
    imgUrl = map["imgUrl"];
    publishedAt = map["publishedAt"];
    source = Source.fromJson(map["source"]);
    isLike = false;
  }
}

class Source {
  String? id;
  String? name;
  Source(this.id, this.name);

  Source.fromJson(Map<String, dynamic> map) {
    id = map["id"];
    name = map["name"];
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}
