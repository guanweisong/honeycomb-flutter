import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/widgets/footer.dart';
import 'package:honeycomb_flutter/widgets/x_menu.dart';

class XScaffold extends StatelessWidget {
  bool? scroll;
  bool? showFooter;
  PreferredSizeWidget appBar;
  Widget body;

  XScaffold({
    Key? key,
    this.scroll,
    this.showFooter,
    required this.appBar,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      endDrawer: Drawer(
        child: XMenu(),
      ),
      body: scroll == true
          ? SingleChildScrollView(
              child: renderBody(),
            )
          : renderBody(),
    );
  }

  renderBody() {
    if (showFooter == true) {
      List<Widget> children = [body];
      children.add(Footer());
      return SafeArea(
        child: Column(
          children: children,
        ),
      );
    } else {
      return SafeArea(
        child: body,
      );
    }
  }
}
