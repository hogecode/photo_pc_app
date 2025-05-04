import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/image_model.dart';

class ImageTile extends StatelessWidget {
  final ImageModel image;

  const ImageTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/detail', extra: image.path);
      },
      child: Image.file(
        File(image.path),
        fit: BoxFit.cover,
      ),
    );
  }
}
