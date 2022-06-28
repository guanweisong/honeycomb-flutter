import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/controllers/setting_controller.dart';
import 'package:get/get.dart';
import 'package:honeycomb_flutter/pages/page/controller.dart';
import 'package:intl/intl.dart';
import 'package:honeycomb_flutter/widgets/x_scaffold.dart';
import 'package:honeycomb_flutter/widgets/x_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:honeycomb_flutter/models/icon_text.dart';

class PagePage extends GetView {
  const PagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find<SettingController>();
    return XScaffold(
      scroll: true,
      showFooter: true,
      appBar: XAppBar(title: settingController.setting?.siteName ?? ''),
      body: GetBuilder<PagePageController>(
        init: PagePageController(),
        global: false,
        builder: (controller) {
          if (controller.pageDetail != null) {
            return Container(
              width: double.infinity,
              color: const Color.fromRGBO(255, 255, 255, 1),
              margin: const EdgeInsets.only(top: 12),
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [renderContent(controller)],
              ),
            );
          } else {
            return Container(
              padding: const EdgeInsets.only(top: 100),
              width: double.infinity,
              child: const Text(
                'Loading...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  renderContent(PagePageController page) {
    List<Widget> column = [];

    column.add(
      SizedBox(
        width: double.infinity,
        child: Text(
          page.pageDetail!.pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
    column.add(renderInfo(page));
    column.add(renderLine());
    column.add(Html(
      data: page.pageDetail!.pageContent,
      customImageRenders: {
        (attr, _) => true: networkImageRender(
          loadingWidget: () => const SizedBox(
            width: double.infinity,
            child: Text(
              'Loading...',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
            ),
          ),
          mapUrl: (url) => url!.contains('https') ? url : "https:$url",
        ),
      },
    ));
    column.add(renderLine());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: column,
    );
  }

  // 渲染分割线
  renderLine() {
    return Container(
      height: 1,
      color: const Color.fromRGBO(0, 0, 0, 0.1),
      margin: const EdgeInsets.only(top: 8, bottom: 8),
    );
  }

  // 渲染文章常用信息
  renderInfo(PagePageController page) {
    List<IconText> list = [];
    list.add(IconText(
      icon: const Icon(Icons.person, size: 14),
      text: page.pageDetail!.pageAuthor.userName,
    ));
    list.add(IconText(
      icon: const Icon(Icons.date_range_rounded, size: 14),
      text: DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(page.pageDetail!.createdAt)),
    ));
    list.add(IconText(
      icon: const Icon(Icons.message_rounded, size: 14),
      text: "${page.commentTotal ?? ''}条留言",
    ));
    list.add(IconText(
      icon: const Icon(Icons.remove_red_eye_rounded, size: 14),
      text: "${page.views ?? ''}次浏览",
    ));
    List<Widget> items = [];
    for (var item in list) {
      items.add(
        Row(children: [
          Container(
            margin: const EdgeInsets.only(right: 2),
            child: item.icon,
          ),
          Text(
            item.text,
            style: const TextStyle(fontSize: 14),
          ),
        ]),
      );
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Opacity(
        opacity: 0.7,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: items,
          ),
        ]),
      ),
    );
  }
}
