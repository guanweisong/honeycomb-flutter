import 'package:honeycomb_flutter/models/entity/post.dart';
import 'package:honeycomb_flutter/models/response/base_response.dart';
import 'package:honeycomb_flutter/models/response/query_post_list_response.dart';
import 'package:honeycomb_flutter/utils/api.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  List<Post>? postList;
  int? total;
  int pageNo = 1;

  @override
  onReady() {
    refreshPostList();
  }

  // 刷新文章列表
  refreshPostList() async {
    pageNo = 1;
    var res = await queryPostList({...Get.parameters, "page": pageNo});
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      var result = QueryPostListResponse.fromJson(response.data);
      postList = result.list;
      total = result.total;
      update();
    }
  }

  // 滚定加载文章列表
  loadPostList() async {
    pageNo++;
    var res = await queryPostList({...Get.parameters, "page": pageNo});
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      var result = QueryPostListResponse.fromJson(response.data);
      postList = [...postList!, ...result.list];
      update();
    }
  }
}
