import 'package:get/get.dart';
import 'package:honeycomb_flutter/pages/list/page.dart';
import 'package:honeycomb_flutter/pages/page/page.dart';
import 'package:honeycomb_flutter/pages/post/page.dart';
import 'package:honeycomb_flutter/routes/app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(name: Routes.list, page: () => ListPage()),
    GetPage(name: Routes.post, page: () => const PostPage()),
    GetPage(name: Routes.page, page: () => const PagePage()),
  ];
}
