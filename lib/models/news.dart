import 'dart:convert';

class Article {
  String? id;
  String? author;
  String? title;
  String? desc;
  String? url;
  String? urlImg;
  String? publishAt;
  String? content;

  Article({
    this.id,
    this.author,
    this.title,
    this.desc,
    this.url,
    this.urlImg,
    this.publishAt,
    this.content,
  });

  factory Article.fromMap(Map<String, dynamic> json) {
    return Article(
      id: json['id'],
      author: json['author'],
      title: json['title'],
      desc: json['description'],
      url: json['url'],
      urlImg: json['urlToImage'],
      publishAt: json['publishedAt'],
      content: json['content'],
    );
  }

  factory Article.fromJson(String result) =>
      Article.fromMap(json.decode(result));
}
