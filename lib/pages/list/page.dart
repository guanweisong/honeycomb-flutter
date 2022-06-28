import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/controllers/menu_controller.dart';
import 'package:honeycomb_flutter/controllers/setting_controller.dart';
import 'package:honeycomb_flutter/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:honeycomb_flutter/pages/list/controller.dart';
import 'package:honeycomb_flutter/widgets/x_scaffold.dart';
import 'package:honeycomb_flutter/widgets/x_app_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models/entity/post.dart';

class ListPage extends GetView {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  // 下拉刷新
  Future<void> _onRefresh(ListController listController) async {
    try {
      await listController.refreshPostList();
      _refreshController.refreshCompleted();
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.refreshFailed();
    }
  }

  // 上拉加载
  Future<void> _onLoading(ListController e) async {
    if ((e.total! / 10).ceil() == e.pageNo) {
      _refreshController.loadNoData();
      return;
    }
    try {
      await e.loadPostList();
      _refreshController.loadComplete();
    } catch (e) {
      _refreshController.loadFailed();
    }
  }

  @override
  Widget build(BuildContext context) {
    MenuController menuController = Get.find<MenuController>();
    SettingController settingController = Get.find<SettingController>();
    return XScaffold(
      appBar: XAppBar(title: getTitle(menuController, settingController)),
      body: GetBuilder<ListController>(
        init: ListController(),
        global: false,
        builder: (controller) {
          return controller.postList == null
              ? Container(
                  padding: const EdgeInsets.only(top: 100),
                  width: double.infinity,
                  child: const Text(
                    'Loading...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                    ),
                  ),
                )
              : SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  controller: _refreshController,
                  onRefresh: () => _onRefresh(controller),
                  onLoading: () => _onLoading(controller),
                  child: ListView.builder(
                    physics: const ScrollPhysics(),
                    itemBuilder: (context, index) => renderItem(
                      controller.postList![index],
                    ),
                    itemCount: controller.postList!.length,
                  ),
                );
        },
      ),
    );
  }

  renderItem(Post subject) {
    List<Widget> column = [];
    switch (subject.postType) {
      case 0:
      case 1:
      case 2:
        column.add(SizedBox(
          child: Image.network(
            'https://${subject.postCover?.mediaUrl}?imageMogr2/thumbnail/750x',
            fit: BoxFit.cover,
          ),
        ));
        column.add(Container(
          margin: const EdgeInsets.only(top: 12),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                subject.getTitle(),
                style: const TextStyle(
                  fontSize: 14.0,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ));
        break;
      case 3:
        column.add(Text(subject.quoteContent!));
        break;
    }

    return InkWell(
      onTap: () {
        Get.toNamed(Routes.post,
            parameters: <String, String>{"id": subject.id});
      },
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.all(12),
        color: const Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          children: column,
        ),
      ),
    );
  }

  // 获取列表标题
  getTitle(
      MenuController? menuController, SettingController? settingController) {
    String? id = Get.parameters["category_id"];
    String? title = settingController?.setting?.siteName ?? "";
    if (id != null && menuController?.menu != null) {
      for (var item in menuController!.menu!) {
        if (item.id == id) {
          title = item.categoryTitle!;
        }
      }
    }
    return title;
  }
}
