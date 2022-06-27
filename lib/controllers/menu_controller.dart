import 'package:honeycomb_flutter/models/entity/menu.dart';
import 'package:honeycomb_flutter/models/response/base_response.dart';
import 'package:honeycomb_flutter/models/response/query_menu_list_response.dart';
import 'package:honeycomb_flutter/utils/api.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  List<Menu>? menu;

  @override
  onReady() {
    getMenu();
  }

  // 获取菜单列表
  getMenu() async {
    var res = await queryMenu();
    var response = BaseResponse.fromJson(res);
    if (response.isSuccess()) {
      var result = QueryMenuListResponse.fromJson(response.data);
      menu = result.list;
      update();
    }
  }
}
