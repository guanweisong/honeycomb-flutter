class QueryViewsResponse {
  late int count;

  QueryViewsResponse(this.count);

  QueryViewsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }
}
