import 'package:flutter/material.dart';
import 'package:photo_pc_app/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';
import 'package:desktop_drop/desktop_drop.dart';
import '../providers/image_provider.dart';

class TemplateWidget extends StatelessWidget {
  final Widget body; 

  TemplateWidget({required this.body});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FolderImageProvider>(context);

    return Scaffold(
      appBar: AppBarWidget(),
      body: DropTarget(
        onDragDone: (details) {
          // ドラッグ＆ドロップされたファイルを処理
          if (details.files.isNotEmpty) {
            final folderPath = details.files.first.path;
            provider.dragAndDropFolder(folderPath); // フォルダを処理
          }
        },
        onDragEntered: (details) {
          // ドラッグがターゲットに入ったときの処理
        },
        onDragExited: (details) {
          // ドラッグがターゲットから出たときの処理
        },
        child: GestureDetector(
          onPanUpdate: (details) {
            // 必要に応じてドラッグ処理を追加
          },
          child: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                Expanded(child: body), // 外部から渡されたbodyを表示
                // 必要に応じて他のウィジェットを追加
              ],
            ),
          ),
        ),
      ),
    );
  }
}
