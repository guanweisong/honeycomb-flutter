import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/models/icon_text.dart';
import 'package:intl/intl.dart';

class PostInfo extends StatelessWidget {
  String userName;
  String createdAt;
  int commentTotal;
  int views;

  PostInfo({
    Key? key,
    required this.userName,
    required this.createdAt,
    required this.commentTotal,
    required this.views,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<IconText> list = [];
    list.add(IconText(
      icon: const Icon(Icons.person, size: 14),
      text: userName,
    ));
    list.add(IconText(
      icon: const Icon(Icons.date_range_rounded, size: 14),
      text: DateFormat('yyyy-MM-dd').format(DateTime.parse(createdAt)),
    ));
    list.add(IconText(
      icon: const Icon(Icons.message_rounded, size: 14),
      text: "$commentTotal条留言",
    ));
    list.add(IconText(
      icon: const Icon(Icons.remove_red_eye_rounded, size: 14),
      text: "$views次浏览",
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
        opacity: 0.5,
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
