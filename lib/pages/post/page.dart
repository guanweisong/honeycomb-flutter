import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/controllers/setting_controller.dart';
import 'package:honeycomb_flutter/models/tags.dart';
import 'package:get/get.dart';
import 'package:honeycomb_flutter/routes/app_routes.dart';
import 'package:honeycomb_flutter/widgets/post_skeleton.dart';
import 'package:intl/intl.dart';
import 'package:honeycomb_flutter/pages/post/controller.dart';
import 'package:honeycomb_flutter/widgets/x_scaffold.dart';
import 'package:honeycomb_flutter/widgets/x_app_bar.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:honeycomb_flutter/widgets/post_info.dart';
import 'package:skeletons/skeletons.dart';

class PostPage extends GetView {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find<SettingController>();
    return XScaffold(
      scroll: true,
      showFooter: true,
      appBar: XAppBar(
        title: Obx(
          () => Text(
            settingController.setting.value.siteName ?? "",
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
        ),
      ),
      body: GetBuilder<PostController>(
        init: PostController(),
        global: false,
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
            return PostSkeleton();
          }
        },
      ),
    );
  }

  // 渲染正文
  renderContent(PostController post) {
    List<Widget> column = [];
    switch (post.postDetail?.postType) {
      case 0:
      case 1:
      case 2:
        column.add(
          SizedBox(
            width: double.infinity,
            child: Text(
              post.postDetail!.getTitle(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        );
        column.add(renderInfo(post));
        column.add(renderLine());
        column.add(Html(
          data: post.postDetail!.postContent,
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
        column.add(renderExtra(post));
        column.add(renderTags(post));
        break;
      case 3:
        column.add(renderInfo(post));
        column.add(renderLine());
        column.add(Container(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Text(post.postDetail!.quoteContent!)));
        column.add(renderLine());
        column.add(renderExtra(post));
        break;
    }
    if (post.ramdonList.isNotEmpty) {
      column.add(renderLine());
      column.add(renderRandomPostList(post));
    }
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
  renderInfo(PostController post) {
    return PostInfo(
      userName: post.postDetail!.postAuthor.userName,
      createdAt: post.postDetail!.createdAt,
      commentTotal: post.commentTotal ?? 0,
      views: post.views ?? 0,
    );
  }

  // 渲染文章额外信息
  renderExtra(PostController post) {
    switch (post.postDetail!.postType) {
      case 0:
        return null;
      case 1:
        return Opacity(
          opacity: 0.5,
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
        return Opacity(
          opacity: 0.5,
          child: Row(
            children: [
              const Icon(
                Icons.photo_camera,
                size: 14,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: const Text("拍摄于"),
              ),
              Text(post.postDetail!.galleryLocation!),
            ],
          ),
        );
      case 3:
        return Opacity(
          opacity: 0.5,
          child: Row(
            children: [
              const Icon(
                Icons.article_rounded,
                size: 14,
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
                child: const Text("节选自"),
              ),
              Text(post.postDetail!.quoteAuthor!),
            ],
          ),
        );
    }
  }

  // 渲染tag信息
  renderTags(PostController post) {
    List<Tags> list = [];
    if (post.postDetail!.movieDirector!.isNotEmpty) {
      list.add(Tags(label: '导演', tags: post.postDetail!.movieDirector!));
    }
    if (post.postDetail!.movieActor!.isNotEmpty) {
      list.add(Tags(label: '演员', tags: post.postDetail!.movieActor!));
    }
    if (post.postDetail!.movieStyle!.isNotEmpty) {
      list.add(Tags(label: '风格', tags: post.postDetail!.movieStyle!));
    }
    if (post.postDetail!.galleryStyle!.isNotEmpty) {
      list.add(Tags(label: '风格', tags: post.postDetail!.galleryStyle!));
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
      items.add(Opacity(
        opacity: 0.8,
        child: Wrap(children: [
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
      ));
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

  // 渲染随机文章列表
  renderRandomPostList(PostController post) {
    List<Widget> list = [];
    list.add(
      Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: const Text(
          '猜你喜欢',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
    for (var item in post.ramdonList) {
      list.add(
        InkWell(
          onTap: () => {
            Get.toNamed(Routes.post,
                parameters: <String, String>{"id": item!.id})
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 3, bottom: 3),
            child: Wrap(
              children: [
                Text('• ${item?.postTitle ?? item?.quoteContent ?? ""}'),
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: list,
      ),
    );
  }
}
