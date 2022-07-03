import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  Widget title;

  XAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: () {
          Get.back();
        },
      ),
      title: title,
      centerTitle: true,
    );
  }
}
