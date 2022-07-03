import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/controllers/menu_controller.dart';
import 'package:honeycomb_flutter/models/entity/menu.dart';
import 'package:honeycomb_flutter/routes/app_routes.dart';
import 'package:get/get.dart';

class XMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MenuController menuController = Get.find<MenuController>();
    List<Menu> menuTree = fromListToMenu(menuController.menu ?? [], '0');
    return Container(
      padding: const EdgeInsets.all(20),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: renderMenu(menuTree),
          ),
        ),
      ),
    );
  }

  // 渲染菜单列表
  renderMenu(List<Menu> data) {
    List<Widget> items = [];
    renderItem(Menu item) {
      items.add(
        InkWell(
          onTap: () => handleJump(item),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: 12 * item.deep!, top: 12, bottom: 12),
                child: Text(
                    item.type == 0 ? item.categoryTitle! : item.pageTitle!,
                    style: renderMenuCurrentItem(item.id)),
              ),
              Container(
                height: 1,
                color: const Color.fromRGBO(0, 0, 0, 0.1),
              ),
            ],
          ),
        ),
      );
    }

    renderFn(List<Menu> list) {
      for (var m in list) {
        renderItem(m);
        if (m.children!.isNotEmpty) {
          renderFn(m.children!);
        }
      }
    }

    renderFn(data);
    return items;
  }

  // 菜单选中样式
  renderMenuCurrentItem(String id) {
    if (Get.parameters['category_id'] == id || Get.parameters['id'] == id) {
      return const TextStyle(color: Color.fromRGBO(235, 0, 93, 1));
    } else {
      return const TextStyle();
    }
  }

  // 菜单跳转事件
  handleJump(Menu menu) {
    Get.back();
    switch (menu.type) {
      case 0:
        Get.toNamed(
          Routes.list,
          parameters: <String, String>{"category_id": menu.id},
        );
        break;
      case 1:
        Get.toNamed(
          Routes.page,
          parameters: <String, String>{"id": menu.id},
        );
        break;
    }
  }

  // 将菜单List转换为Tree结构
  fromListToMenu(List<Menu> list, String parent) {
    Map<String, int> map = {};
    Menu node;
    List<Menu> roots = [];
    int i;
    for (i = 0; i < list.length; i++) {
      map[list[i].id] = i;
      list[i].children = [];
    }
    for (i = 0; i < list.length; i++) {
      node = list[i];
      if (node.parent != parent) {
        list[map[node.parent]!].children?.add(node);
      } else {
        roots.add(node);
      }
    }
    // 增加deep层级值
    addDeepMark(List<Menu> menu, double deep) {
      for (var item in menu) {
        item.deep = deep;
        if (item.children!.isNotEmpty) {
          addDeepMark(item.children!, deep + 1);
        }
      }
    }

    addDeepMark(roots, 0);
    return roots;
  }
}
