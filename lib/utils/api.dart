import 'package:dio/dio.dart';
import 'package:honeycomb_flutter/utils/request.dart';

// 获取站点配置
Future<Response> querySetting() {
  return dio.get('/settings');
}

// 获取菜单
Future<Response> queryMenu() {
  return dio.get('/menus');
}

// 获取文章列表
Future<Response> queryPostList(parameters) {
  return dio.get('/posts', queryParameters: parameters);
}

// 获取随机文章列表
Future<Response> queryRandomPostList(String postCategory, int number) {
  return dio.get('/posts/random',
      queryParameters: {"post_category": postCategory, "number": number});
}

// 获取文章详情
Future<Response> queryPostDetail(parameters) {
  return dio.get('/posts/${parameters['id']}');
}

// 获取文章浏览量
Future<Response> queryPostViews(parameters) {
  return dio.get('/posts/${parameters['id']}/views');
}

// 获取评论列表
Future<Response> queryComments(parameters) {
  return dio.get('/comments/${parameters['id']}');
}

// 获取页面详情
Future<Response> queryPageDetail(parameters) {
  return dio.get('/pages/${parameters['id']}');
}

// 获取页面浏览量
Future<Response> queryPageViews(parameters) {
  return dio.get('/pages/${parameters['id']}/views');
}
