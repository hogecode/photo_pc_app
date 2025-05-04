import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/image_provider.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/image_tile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FolderImageProvider>(context);

    return Scaffold(
      appBar: AppBarWidget(),  
      body: Column(
        children: [
          Expanded(
            child: DragTarget<String>(
              onAccept: (data) {
                provider.dragAndDropFolder(data);
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                  color: Colors.grey[200],
                  child: provider.images.isEmpty
                      ? Center(child: Text('画像がありません'))
                      : GridView.builder(
                          itemCount: provider.images.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) {
                            final image = provider.images[index];
                            return ImageTile(image: image);
                          },
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
