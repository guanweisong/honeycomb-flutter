class Page {
  late String id;
  late int pageViews;
  late String pageContent;
  late String pageTitle;
  late int pageStatus;
  late PageAuthor pageAuthor;
  late String updatedAt;
  late String createdAt;

  Page({
    required this.id,
    required this.pageViews,
    required this.pageStatus,
    required this.pageAuthor,
    required this.pageContent,
    required this.pageTitle,
    required this.updatedAt,
    required this.createdAt,
  });

  Page.fromJson(Map<String, dynamic> json) {
    id = json["_id"].toString();
    pageViews = json["page_views"].toInt();
    pageStatus = json["page_status"].toInt();
    pageAuthor = PageAuthor.fromJson(json["page_author"]);
    pageContent = json["page_content"].toString();
    pageTitle = json["page_title"].toString();
    updatedAt = json["updated_at"].toString();
    createdAt = json["created_at"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["page_views"] = pageViews;
    data["page_status"] = pageStatus;
    data["page_author"] = pageAuthor.toJson();
    data["post_content"] = pageContent;
    data["post_title"] = pageTitle;
    data["updated_at"] = updatedAt;
    data["created_at"] = createdAt;
    return data;
  }
}

class PageAuthor {
  late String id;
  late String userName;

  PageAuthor({required this.id, required this.userName});

  PageAuthor.fromJson(Map<String, dynamic> json) {
    if (json["_id"] is String) id = json["_id"];
    if (json["user_name"] is String) userName = json["user_name"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["user_name"] = userName;
    return data;
  }
}
