class QueryPostViewsResponse {
  late int count;

  QueryPostViewsResponse(this.count);

  QueryPostViewsResponse.fromJson(Map<String, dynamic> json) {
    count = json['count'];
  }
}
