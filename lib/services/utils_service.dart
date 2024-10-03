import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  static void showToast() {
    Fluttertoast.showToast(
      msg: "Download completed",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 10,
      backgroundColor: Colors.grey[300],
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static String formatNumber(int? number) {
    if (number == null) return '0';

    if (number >= 1000000) {
      double result = number / 1000000;
      return '${result.toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      double result = number / 1000;
      return '${result.toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  static Future<void> downloadImage(String url) async {
    // Check and request permission
    PermissionStatus permission = await Permission.storage.request();
    if (!permission.isGranted) {
      print('Permission denied');
      return;
    }

    // Get the image data
    final http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Get the external storage directory
      final directory = await getExternalStorageDirectory();
      String downloadsPath = '/storage/emulated/0/Download';

      // Ensure the directory exists
      Directory(downloadsPath).createSync(recursive: true);

      // Create a file name based on the current timestamp
      String fileName = 'image_${DateTime.now().millisecondsSinceEpoch}.jpg';
      File file = File('$downloadsPath/$fileName');

      // Write the file to the Downloads folder
      await file.writeAsBytes(response.bodyBytes);
      print('Image saved to $downloadsPath/$fileName');
    } else {
      print('Failed to download image');
    }

    Utils.showToast();
  }
}
