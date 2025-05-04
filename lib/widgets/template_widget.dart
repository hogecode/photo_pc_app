import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/image_provider.dart';

class TemplateWidget extends StatelessWidget {
  final Widget body;  // Body部分は外から渡される

  TemplateWidget({required this.body});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FolderImageProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('画像管理アプリ'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // ここにAppBarのアクションを追加できます
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: DragTarget<String>(
              onAccept: (data) {
                provider.dragAndDropFolder(data);  // ドラッグされたデータを処理
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  color: Colors.grey[200],
                  child: body,  // 外から渡されたbodyを表示
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
