import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/controllers/setting_controller.dart';
import 'package:honeycomb_flutter/models/tags.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:honeycomb_flutter/pages/post/controller.dart';
import 'package:honeycomb_flutter/widgets/x_scaffold.dart';
import 'package:honeycomb_flutter/widgets/x_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:honeycomb_flutter/models/icon_text.dart';

class PostPage extends GetView {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find<SettingController>();
    return XScaffold(
      scroll: true,
      showFooter: true,
      appBar: XAppBar(title: settingController.setting?.siteName ?? ''),
      body: GetBuilder<PostController>(
        init: PostController(),
        builder: (controller) {
          if (controller.postDetail != null) {
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

  renderContent(PostController post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Text(
            post.postDetail!.getTitle(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        renderInfo(post),
        renderLine(),
        Html(
          data: post.postDetail!.postContent,
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
        ),
        renderLine(),
        renderExtra(post),
        renderTags(post),
      ],
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
  renderInfo(PostController post) {
    List<IconText> list = [];
    list.add(IconText(
      icon: const Icon(Icons.person, size: 14),
      text: post.postDetail!.postAuthor.userName,
    ));
    list.add(IconText(
      icon: const Icon(Icons.date_range_rounded, size: 14),
      text: DateFormat('yyyy-MM-dd')
          .format(DateTime.parse(post.postDetail!.createdAt)),
    ));
    list.add(IconText(
      icon: const Icon(Icons.message_rounded, size: 14),
      text: "条留言",
    ));
    list.add(IconText(
      icon: const Icon(Icons.remove_red_eye_rounded, size: 14),
      text: "${post.views ?? ''}次浏览",
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

  // 渲染文章额外信息
  renderExtra(PostController post) {
    switch (post.postDetail!.postType) {
      case 1:
        return Opacity(
          opacity: 0.8,
          child: Row(
            children: [
              const Icon(
                Icons.movie,
                size: 14,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: const Text("上映于"),
              ),
              Text(
                DateFormat('yyyy-MM-dd').format(
                  DateTime.parse(post.postDetail!.movieTime!),
                ),
              ),
            ],
          ),
        );
      case 2:
        return Text('2');
      case 3:
        return Text('2');
    }
  }

  // 渲染tag信息
  renderTags(PostController post) {
    List<Tags> list = [];
    if (post.postDetail!.movieDirector != null) {
      list.add(Tags(label: '导演', tags: post.postDetail!.movieDirector!));
    }
    if (post.postDetail!.movieActor != null) {
      list.add(Tags(label: '演员', tags: post.postDetail!.movieActor!));
    }
    if (post.postDetail!.movieStyle != null) {
      list.add(Tags(label: '风格', tags: post.postDetail!.movieStyle!));
    }
    List<Widget> items = [];
    for (var item in list) {
      List<Widget> tagList = [];
      for (var m in item.tags) {
        tagList.add(
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(
              m.tagName,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        );
      }
      items.add(
        Wrap(children: [
          Container(
            margin: const EdgeInsets.only(right: 4),
            child: Text(
              "${item.label}:",
              style: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(0, 0, 0, 0.6),
              ),
            ),
          ),
          Wrap(
            children: tagList,
          )
        ]),
      );
    }
    return Container(
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }
}
