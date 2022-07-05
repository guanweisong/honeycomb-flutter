import 'package:honeycomb_flutter/models/entity/comment.dart';
import 'package:honeycomb_flutter/models/entity/post_random.dart';
import 'package:honeycomb_flutter/models/response/base_response.dart';
import 'package:honeycomb_flutter/models/response/query_comment_list_response.dart';
import 'package:honeycomb_flutter/models/response/query_views_response.dart';
import 'package:honeycomb_flutter/models/response/query_post_list_random_response.dart';
import 'package:get/get.dart';
import 'package:honeycomb_flutter/utils/api.dart';
import '../../models/entity/post.dart';

class PostController extends GetxController {
  Post? postDetail;
  int? views;
  List<Comment>? commentList;
  int? commentTotal;
  List<PostRandom?> ramdonList = [];

  @override
  onReady() {
    getPostDetail();
    getPostViews();
    getComments();
  }

  // 查询随机文章
  getRandomPostList() async {
    var res = await queryRandomPostList(postDetail!.postCategory.id, 10);
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      ramdonList = QueryPostListRandomResponse.fromJson(response.data).list;
      update();
    }
  }

  // 查询文章详情
  getPostDetail() async {
    var res = await queryPostDetail(Get.parameters);
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      postDetail = Post.fromJson(response.data);
      update();
      getRandomPostList();
    }
  }

  // 查询文章浏览量
  getPostViews() async {
    var res = await queryPostViews(Get.parameters);
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
