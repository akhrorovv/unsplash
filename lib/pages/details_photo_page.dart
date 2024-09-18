import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/details_photo_model.dart';

class DetailsPhotoPage extends StatefulWidget {
  final String? id;
  final DetailsPhoto? photo;

  const DetailsPhotoPage({super.key, this.id, this.photo});

  @override
  State<DetailsPhotoPage> createState() => _DetailsPhotoPageState();
}

class _DetailsPhotoPageState extends State<DetailsPhotoPage> {
  late String id;
  late DetailsPhoto photo;

  String formatNumber(int? number) {
    if (number! >= 1000) {
      double result = number / 1000;
      return '${result.toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  // apiDetailsPhoto() async {
  //   try {
  //     var response = await Network.GET(
  //       Network.API_PHOTO.replaceFirst(':id', id),
  //       Network.paramsCollectionsPhotos(),
  //     );
  //
  //     setState(() {
  //       photo = Network.parseDetailsPhoto(response!);
  //     });
  //
  //     LogService.d(response.toString());
  //   } catch (e) {
  //     LogService.e(e.toString());
  //   }
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = widget.id!;
    photo = widget.photo!;
    // apiDetailsPhoto();
  }

  String getCameraName() {
    if (photo.exif!.name == null) {
      return 'Unknown';
    }
    return photo.exif!.name!;
  }

  @override
  Widget build(BuildContext context) {
    // if (photo == null) {
    //   return const Scaffold(
    //     backgroundColor: Colors.white,
    //     body: Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   ); // Show loading if null
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Set status bar color and brightness
          AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle(
              statusBarColor: Colors.black.withOpacity(0.3),
              // Make status bar transparent
              statusBarIconBrightness:
                  Brightness.light, // Light status bar icons
            ),
            child: Container(
              color: Colors.transparent, // Background of the status bar
            ),
          ),

          // Body content with an image at the top
          Column(
            children: [
              Hero(
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

              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // profile
                      Container(
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.blue,
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://images.unsplash.com/photo-1719937206930-84afb0daf141?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w1OTMyMzl8MXwxfGFsbHwxfHx8fHx8Mnx8MTcyNjI1NjQxOHw&ixlib=rb-4.0.3&q=80&w=1080',
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
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                const Text(
                                  "Samsung Memory",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Montserrat",
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  const Icon(Icons.upload, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Divider(),
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
                                    "${photo.exif!.name}" ?? "Unknown",
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
                                  photo.exif!.aperture ?? "Unknown",
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
                                  "${photo.exif!.focalLength} mm"  ?? "Unknown",
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
                            child:  Column(
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
                                  "${photo.exif!.exposureTime} s" ?? "Unknown",
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
                                  photo.exif!.iso.toString(),
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
                      const Divider(),
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
                      const Divider(),
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
