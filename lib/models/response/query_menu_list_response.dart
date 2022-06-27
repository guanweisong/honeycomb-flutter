import 'package:honeycomb_flutter/models/entity/menu.dart';

class QueryMenuListResponse {
  late List<Menu> list;
  late int total;

  QueryMenuListResponse(this.list, this.total);

  QueryMenuListResponse.fromJson(Map<String, dynamic> json) {
    total = json["total"].toInt();
    list = List<Menu>.from(
        json["list"].map((item) => Menu.fromJson(item)).toList());
  }
}
