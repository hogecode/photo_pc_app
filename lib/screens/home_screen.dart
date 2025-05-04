import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/image_provider.dart';
import '../widgets/image_tile.dart';
import '../widgets/template_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FolderImageProvider>(context);

    return TemplateWidget(
      body: provider.images.isEmpty
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
  }
}
