import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as path_provider;

class AppMedia {
  final ImagePicker imagePicker;
  const AppMedia({required this.imagePicker});

  Future<XFile?> pickImage() async {
    return await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 90,
    );
  }

  Future<List<XFile>?> pickMultipleMedia() async {
    return await imagePicker.pickMultipleMedia();
  }

  Future<XFile?> takeImage() async {
    return imagePicker.pickImage(source: ImageSource.camera);
  }

  Future<XFile?> pickVideo() async {
    return imagePicker.pickVideo(source: ImageSource.gallery);
  }

  Future<XFile?> takeVideo() async {
    return imagePicker.pickVideo(source: ImageSource.camera);
  }

  Future<String?> convertToBase64(XFile image) async {
    final imageString = decodeImage(File(image.path).readAsBytesSync());
    if (imageString == null) {
      return null;
    }
    return base64Encode(encodeJpg(imageString));
  }

  static Future<File?> pickImageWithSizeLimit(BuildContext context,
      {int maxSizeInMB = 2, required XFile pickedFile}) async {
    try {
      File file = File(pickedFile.path);
      int sizeInBytes = await file.length();
      double sizeInMB = sizeInBytes / (1024 * 1024);

      if (sizeInMB <= maxSizeInMB) {
        //  file=await  compressAndGetFile(file: file as XFile );
        final compressedfile = await compressAndGetFile(file: file);
        return  File(compressedfile!.path);
      } else {
        // Show an error message
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Image size should be less than $maxSizeInMB MB. Selected image is ${sizeInMB.toStringAsFixed(2)} MB.')),
          );
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error picking image: $e');
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error picking image. Please try again.')),
        );
      }
      return null;
    }
  }

  static Future<XFile?> compressAndGetFile({required File file}) async {
    final dir = await path_provider.getTemporaryDirectory();
    final targetPath =
        path.join(dir.absolute.path, 'compressed_${path.basename(file.path)}');
    var result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      targetPath,
      format: CompressFormat.png,
      quality: 88,
    );

    if (kDebugMode) {
      print(' file length ${file.length()}');
    }
    if (kDebugMode) {
      print('result?.length() ${result?.length()}');
    }

    return result;
  }
}
