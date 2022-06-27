import 'package:flutter/material.dart';
import 'package:honeycomb_flutter/widgets/footer.dart';
import 'package:honeycomb_flutter/widgets/x_menu.dart';

class XScaffold extends StatefulWidget {
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
  State<XScaffold> createState() => _XScaffoldState();
}

class _XScaffoldState extends State<XScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      endDrawer: Drawer(
        child: XMenu(),
      ),
      body: widget.scroll == true
          ? SingleChildScrollView(
              child: renderBody(),
            )
          : renderBody(),
    );
  }

  renderBody() {
    if (widget.showFooter == true) {
      List<Widget> children = [widget.body];
      children.add(Footer());
      return SafeArea(
        child: Column(
          children: children,
        ),
      );
    } else {
      return SafeArea(
        child: widget.body,
      );
    }
  }
}
