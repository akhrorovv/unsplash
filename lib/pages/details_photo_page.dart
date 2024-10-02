import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:unsplash/pages/show_photo_page.dart';

import '../models/details_photo_model.dart';

class DetailsPhotoPage extends StatefulWidget {
  final DetailsPhoto? photo;

  const DetailsPhotoPage({super.key, this.photo});

  @override
  State<DetailsPhotoPage> createState() => _DetailsPhotoPageState();
}

class _DetailsPhotoPageState extends State<DetailsPhotoPage> {
  late DetailsPhoto photo;

  String formatNumber(int? number) {
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

  goShowPhotoPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShowPhotoPage(
          id: photo.id,
          imgUrl: photo.urls.regular,
          width: photo.width,
          height: photo.height,
        ),
      ),
    );
  }

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

  Future<void> downloadImage(String url) async {
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

    showToast();
  }

  @override
  void initState() {
    super.initState();

    photo = widget.photo!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [

          // // Set status bar color and brightness
          // AnnotatedRegion<SystemUiOverlayStyle>(
          //   value: SystemUiOverlayStyle(
          //     statusBarColor: Colors.black.withOpacity(0.3),
          //     // Make status bar transparent
          //     statusBarIconBrightness:
          //         Brightness.light, // Light status bar icons
          //   ),
          //   child: Container(color: Colors.transparent),
          // ),

          // Body content with an image at the top
          Column(
            children: [
              // image
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      goShowPhotoPage();
                    },
                    child: Hero(
                      tag: photo.id,
                      child: CachedNetworkImage(
                        imageUrl: photo.urls.regular,
                        height: 280,
                        placeholder: (context, urls) => Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              // borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Positioned(
                      top: MediaQuery.of(context).padding.top, // Adjusts for status bar height
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, size: 40,),
                        color: Colors.white.withOpacity(0.0), // Transparent icon color
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // profile
                      SizedBox(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue,
                                    ),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: photo.user.profileImage.medium,
                                      placeholder: (context, urls) => Center(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ),
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Text(
                                      photo.user.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                downloadImage(photo.urls.full);
                              },
                              icon: const Icon(Icons.download,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                          height: 1, color: Color.fromRGBO(226, 226, 226, 1)),
                      const SizedBox(height: 15),
                      Text(
                        photo.altDescription,
                        maxLines: 2,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Montserrat",
                        ),
                      ),
                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Camera",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Text(
                                    photo.exif!.name,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Montserrat",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Aperture",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  photo.exif!.aperture,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Focal Length",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  photo.exif!.focalLength != "Unknown"
                                      ? "${photo.exif!.focalLength} mm"
                                      : photo.exif!.focalLength,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Shutter Speed",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  photo.exif!.exposureTime != "Unknown"
                                      ? "${photo.exif!.exposureTime} s"
                                      : photo.exif!.exposureTime,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "ISO",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  photo.exif!.iso != 0
                                      ? photo.exif!.iso.toString()
                                      : "Unknown",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (MediaQuery.of(context).size.width - 30) / 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Dimensions",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  "${photo.width} × ${photo.height}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 15),
                      const Divider(
                          height: 1, color: Color.fromRGBO(226, 226, 226, 1)),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  "Views",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  formatNumber(photo.views),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  "Downloads",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  formatNumber(photo.downloads),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Text(
                                  "Likes",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                                Text(
                                  formatNumber(photo.likes),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      const Divider(
                          height: 1, color: Color.fromRGBO(226, 226, 226, 1)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
