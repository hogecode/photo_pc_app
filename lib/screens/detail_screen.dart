import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:typed_data';
import 'package:crop_your_image/crop_your_image.dart'; // 実際のライブラリ
import '../widgets/template_widget.dart';

class DetailScreen extends StatefulWidget {
  final String imagePath;

  const DetailScreen({required this.imagePath});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late CropController _controller; // CropControllerを使用して画像操作を管理
  late Uint8List _imageBytes; // 画像のバイトデータを保持

  @override
  void initState() {
    super.initState();
    _controller = CropController();

    // 画像を読み込んで、バイトデータを保持
    _loadImage();
  }

  // 画像をファイルからバイトデータに変換して読み込む
  Future<void> _loadImage() async {
    final file = File(widget.imagePath);
    final bytes = await file.readAsBytes();
    setState(() {
      _imageBytes = bytes;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // トリミング後の画像を取得するためのコールバック
  void _onCropped(Uint8List croppedImage) {
    // 画像をファイルとして保存する処理を追加
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('画像をトリミングしました！')));
  }

  @override
  Widget build(BuildContext context) {
    return TemplateWidget(
      body:
          _imageBytes.isEmpty
              ? Center(child: CircularProgressIndicator()) // 画像が読み込まれていない場合
              : Column(
                children: [
                  Expanded(
                    child: Crop(
                      image: _imageBytes, // 画像データを渡す
                      onCropped: _onCropped, // トリミング後の処理
                      controller: _controller, // コントローラーを設定
                      aspectRatio: 1.0, // アスペクト比1:1に設定
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.crop(); // トリミングボタン
                      },
                      child: Text('画像をトリミング'),
                    ),
                  ),
                ],
              ),
    );
  }
}
