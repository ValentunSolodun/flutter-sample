import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {

  MyAppBar({@required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text('$title'), backgroundColor: Colors.red);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
