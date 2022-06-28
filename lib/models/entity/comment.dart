class Comment {
  late String id;
  late String commentPost;
  late String commentAuthor;
  late String commentEmail;
  late String commentIp;
  late String commentContent;
  late int commentStatus;
  late String commentAgent;
  late String commentParent;
  late String commentAvatar;
  late String updatedAt;
  late String createdAt;
  List<Comment>? children;

  Comment({
    required this.id,
    required this.commentPost,
    required this.commentAuthor,
    required this.commentEmail,
    required this.commentIp,
    required this.commentContent,
    required this.commentStatus,
    required this.commentAgent,
    required this.commentParent,
    required this.updatedAt,
    required this.createdAt,
    this.children,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    id = json["_id"].toString();
    commentPost = json["comment_post"].toString();
    commentAuthor = json["comment_author"].toString();
    commentEmail = json["comment_email"].toString();
    commentIp = json["comment_ip"].toString();
    commentContent = json["comment_content"].toString();
    commentStatus = json["comment_status"].toInt();
    commentAgent = json["comment_agent"].toString();
    commentParent = json["comment_parent"].toString();
    updatedAt = json["updated_at"].toString();
    createdAt = json["created_at"].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["comment_post"] = commentPost;
    data["comment_author"] = commentAuthor;
    data["comment_email"] = commentEmail;
    data["comment_ip"] = commentIp;
    data["comment_content"] = commentContent;
    data["comment_status"] = commentStatus;
    data["comment_agent"] = commentAgent;
    data["comment_parent"] = commentParent;
    data["updated_at"] = updatedAt;
    data["created_at"] = createdAt;
    return data;
  }
}
