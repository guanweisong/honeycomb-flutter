class PostRandom {
  late String id;
  String? quoteContent;
  String? postTitle;

  PostRandom({
    required this.id,
    this.quoteContent,
    this.postTitle,
  });

  PostRandom.fromJson(Map<String, dynamic> json) {
    id = json["_id"].toString();
    quoteContent = json["quote_content"]?.toString();
    postTitle = json["post_title"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["quote_content"] = quoteContent;
    data["post_title"] = postTitle;
    return data;
  }
}
