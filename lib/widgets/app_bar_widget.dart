import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/image_provider.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // PreferredSizeWidget から継承される

  // コンストラクタで preferredSize を初期化
  AppBarWidget({Key? key}) 
      : preferredSize = Size.fromHeight(30),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // FolderImageProvider を使って画像の状態を管理
    final provider = Provider.of<FolderImageProvider>(context);

    return AppBar(
      // title: Text('画像一覧'),
      actions: [
        IconButton(
          icon: Icon(Icons.folder),
          onPressed: () {
            // フォルダ選択機能
            provider.pickFolder();
          },
        ),
      ],
    );
  }
}

