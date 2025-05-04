import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hive/hive.dart';
import '../models/image_model.dart';
import 'package:flutter/material.dart';

class FolderImageProvider extends ChangeNotifier {
  // 画像ファイル拡張子
  static const List<String> imageExtensions = ['.jpg', '.png'];

  // 画像の情報を保持（ImageModelの配列）
  List<ImageModel> _images = [];

  List<ImageModel> get images => _images;

  // フォルダを選択し、画像リストを更新する関数
  Future<void> pickFolder() async {
    final result = await FilePicker.platform.getDirectoryPath();
    // フォルダが選ばれなかった場合
    if (result == null) return; 

    final dir = Directory(result);
    final files =
        dir
            .listSync()
            .where(
              (f) =>
                  f is File &&
                  imageExtensions.any(
                    (ext) => f.path.toLowerCase().endsWith(ext),
                  ),
            )
            .map((f) => ImageModel(path: f.path)) // 画像ファイルをImageModelとして保持
            .toList();

    if (files.isEmpty) return; // 画像がない場合

    _images = files;

    // Hiveにフォルダパスのリストを保存
    final box = await Hive.openBox('imageBox');
    box.put('folderPaths', [result]); // フォルダパスのリストを保存

    notifyListeners();
  }

  // ドラッグ&ドロップでフォルダを選択し、画像リストを更新する関数
  Future<void> dragAndDropFolder(String path) async {
    final dir = Directory(path);
    final files =
        dir
            .listSync()
            .where(
              (f) =>
                  f is File &&
                  imageExtensions.any(
                    (ext) => f.path.toLowerCase().endsWith(ext),
                  ),
            )
            .map((f) => ImageModel(path: f.path)) // 画像ファイルをImageModelとして保持
            .toList();

    if (files.isEmpty) return; // 画像がない場合

    _images = files;

    // Hiveにフォルダパスのリストを保存
    final box = await Hive.openBox('imageBox');
    box.put('folderPaths', [path]); // フォルダパスのリストを保存

    notifyListeners();
  }
}
