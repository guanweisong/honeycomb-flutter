import 'package:honeycomb_flutter/models/entity/comment.dart';
import 'package:honeycomb_flutter/models/entity/page.dart';
import 'package:honeycomb_flutter/models/response/base_response.dart';
import 'package:honeycomb_flutter/models/response/query_comment_list_response.dart';
import 'package:honeycomb_flutter/models/response/query_views_response.dart';
import 'package:get/get.dart';
import 'package:honeycomb_flutter/utils/api.dart';

class PagePageController extends GetxController {
  Page? pageDetail;
  int? views;
  List<Comment>? commentList;
  int? commentTotal;

  @override
  onReady() {
    getPageDetail();
    getPageViews();
    getComments();
  }

  // 查询页面详情
  getPageDetail() async {
    var res = await queryPageDetail(Get.parameters);
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      pageDetail = Page.fromJson(response.data);
      update();
    }
  }

  // 查询页面浏览量
  getPageViews() async {
    var res = await queryPageViews(Get.parameters);
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      views = QueryViewsResponse.fromJson(response.data).count;
      update();
    }
  }

  // 查询评论列表
  getComments() async {
    var res = await queryComments(Get.parameters);
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      QueryCommnetListResponse result =
          QueryCommnetListResponse.fromJson(response.data);
      commentList = result.list;
      commentTotal = result.total;
      update();
    }
  }
}
