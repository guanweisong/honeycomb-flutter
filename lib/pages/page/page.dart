import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/controllers/setting_controller.dart';
import 'package:get/get.dart';
import 'package:honeycomb_flutter/pages/page/controller.dart';
import 'package:honeycomb_flutter/widgets/post_info.dart';
import 'package:honeycomb_flutter/widgets/post_skeleton.dart';
import 'package:honeycomb_flutter/widgets/x_scaffold.dart';
import 'package:honeycomb_flutter/widgets/x_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:skeletons/skeletons.dart';

class PagePage extends GetView {
  const PagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find<SettingController>();
    return XScaffold(
      scroll: true,
      showFooter: true,
      appBar: XAppBar(
        title: Obx(
          () => Text(
            settingController.setting.value.siteName ?? '',
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
        ),
      ),
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
            return PostSkeleton();
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
            child: SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                height: 200,
              ),
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
    return PostInfo(
      userName: page.pageDetail!.pageAuthor.userName,
      createdAt: page.pageDetail!.createdAt,
      commentTotal: page.commentTotal ?? 0,
      views: page.views ?? 0,
    );
  }
}
