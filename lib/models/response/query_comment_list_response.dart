import 'package:honeycomb_flutter/models/entity/comment.dart';

class QueryCommnetListResponse {
  late List<Comment> list;
  late int total;

  QueryCommnetListResponse(this.list, this.total);

  QueryCommnetListResponse.fromJson(Map<String, dynamic> json) {
    total = json["total"].toInt();
    list = List<Comment>.from(
        json["list"].map((item) => Comment.fromJson(item)).toList());
  }
}
