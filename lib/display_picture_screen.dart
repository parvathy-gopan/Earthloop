import 'package:flutter/material.dart';
import 'dart:io';

class DisplayPictureScreen extends StatelessWidget {
  const DisplayPictureScreen({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}