import 'package:honeycomb_flutter/models/entity/post.dart';

class QueryPostListResponse {
  late List<Post> list;
  late int total;

  QueryPostListResponse(this.list, this.total);

  QueryPostListResponse.fromJson(Map<String, dynamic> json) {
    total = json["total"].toInt();
    list = List<Post>.from(
        json["list"].map((item) => Post.fromJson(item)).toList());
  }
}
