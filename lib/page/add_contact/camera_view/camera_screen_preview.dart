import 'package:flutter/material.dart';

class CameraScreenPreview extends StatelessWidget {
  static const PATH = '/camera-screen-preview';

  final String imagePath;

  CameraScreenPreview({
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Preview'),
      ),
      body: Container(),
    );
  }
}
