import 'package:honeycomb_flutter/models/entity/post_random.dart';

class QueryPostListRandomResponse {
  late List<PostRandom> list;

  QueryPostListRandomResponse(
    this.list,
  );

  QueryPostListRandomResponse.fromJson(List<dynamic> json) {
    list = List<PostRandom>.from(
        json.map((item) => PostRandom.fromJson(item)).toList());
  }
}
