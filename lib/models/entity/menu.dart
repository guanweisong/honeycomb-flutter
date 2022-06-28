class Menu {
  late String id;
  late int power;
  late int type;
  late String updatedAt;
  late String createdAt;
  late int v;
  String? parent;
  String? pageTitle;
  String? categoryTitle;
  String? categoryTitleEn;
  List<Menu>? children;
  double? deep;

  Menu(
      {required this.id,
      required this.power,
      required this.type,
      required this.updatedAt,
      required this.createdAt,
      required this.v,
      this.parent,
      this.categoryTitle,
      this.categoryTitleEn,
      this.pageTitle,
      this.children,
      this.deep});

  Menu.fromJson(Map<String, dynamic> json) {
    id = json["_id"].toString();
    power = json["power"].toInt();
    type = json["type"].toInt();
    updatedAt = json["updated_at"].toString();
    createdAt = json["created_at"].toString();
    parent = json["parent"]?.toString() ?? '0';
    categoryTitle = json["category_title"]?.toString();
    categoryTitleEn = json["category_title_en"]?.toString();
    pageTitle = json["page_title"]?.toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["_id"] = id;
    data["power"] = power;
    data["type"] = type;
    data["updated_at"] = updatedAt;
    data["created_at"] = createdAt;
    data["category_title"] = categoryTitle;
    data["category_title_en"] = categoryTitleEn;
    data["page_title"] = pageTitle;
    data["parent"] = parent;
    return data;
  }
}
