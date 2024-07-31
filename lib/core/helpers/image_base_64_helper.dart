import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

class ImageBase64Helper {
  static Future<String> imageToBase64(XFile image) async {
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  }

  static Future<File> base64ToImage(String base64String) async {
    final decodedBytes = base64Decode(base64String);
    return File(decodedBytes.toString());
  }

  static String? getFileMimeType(String filePath) {
    return lookupMimeType(filePath);
  }

  static MemoryImage? base64ToMemoryImage(String? base64String) {
    try {
      if (base64String == null || base64String.length < 100) {
        return null;
      }
      final decodedBytes = base64Decode(base64String);
      return MemoryImage(decodedBytes);
    } catch (e) {
      return null;
    }
  }

  Future<String?> compressImage(XFile image) async {
    final img.Image? imageString =
        img.decodeImage(File(image.path).readAsBytesSync());
    if (imageString == null) {
      // error(AppStrings.imageError.tr());
      return null;
    }

    final compressed = img.copyResize(
      imageString,
      width: 100,
      height: 100,
    );

    return base64Encode(img.encodeJpg(compressed, quality: 85));
  }

  }
