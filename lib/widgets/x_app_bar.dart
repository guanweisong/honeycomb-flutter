import 'package:flutter/material.dart';
import 'package:get/get.dart';

class XAppBar extends StatefulWidget implements PreferredSizeWidget {
  String? title;

  XAppBar({Key? key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return XAppBarState();
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}

class XAppBarState extends State<XAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: () {
          Get.back();
        },
      ),
      title: Text(
        widget.title!,
        style: const TextStyle(color: Color.fromRGBO(0, 0, 0, 0.8)),
      ),
    );
  }
}
