import 'package:honeycomb_flutter/models/response/base_response.dart';
import 'package:honeycomb_flutter/models/response/query_post_views_response.dart';
import 'package:get/get.dart';
import 'package:honeycomb_flutter/utils/api.dart';
import '../../models/entity/post.dart';

class PostController extends GetxController {
  Post? postDetail;
  int? views;

  @override
  onReady() {
    getPostDetail();
    getPostViews();
  }

  // 查询文章详情
  getPostDetail() async {
    var res = await queryPostDetail(Get.parameters);
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      postDetail = Post.fromJson(response.data);
      update();
    }
  }

  // 查询文章浏览量
  getPostViews() async {
    var res = await queryPostViews(Get.parameters);
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      views = QueryPostViewsResponse.fromJson(response.data).count;
      update();
    }
  }

  // 查询评论列表
  getComments() async {
    var response = await queryComments(Get.parameters);
    if (response.statusCode == 200) {
      List<Post> result = [];
      // for (var item in listJson) {
      //   result.add(Post.fromJson(item));
      // }
      // postList = result;
      // update();
    }
  }
}
