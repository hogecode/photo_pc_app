import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/image_provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppBarWidget({Key? key}) : preferredSize = Size.fromHeight(80), super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FolderImageProvider>(context);

    return AppBar(
      title: Text('画像一覧'),
      actions: [
        IconButton(
          icon: Icon(Icons.folder),
          onPressed: () {
            provider.pickFolder();
          },
        ),
      ],
    );
  }
}
