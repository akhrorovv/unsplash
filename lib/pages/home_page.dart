import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/home_controller.dart';

import '../models/photo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.apiPhotos();

    controller.scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call this for AutomaticKeepAliveClientMixin
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.only(left: 5),
            child: MasonryGridView.count(
              controller: controller.scrollController,
              itemCount: controller.photos.length,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return itemOfPhoto(controller.photos[index]);
              },
            ),
          ),
        );
      },
    );
  }

  Widget itemOfPhoto(Photo photo) {
    return GestureDetector(
      onTap: () {
        controller.callDetailsPhotoPage(photo.id);
      },
      child: Hero(
        tag: photo.id,
        child: AspectRatio(
          aspectRatio: photo.width.toDouble() / photo.height.toDouble(),
          child: Container(
            margin: const EdgeInsets.only(right: 5, top: 5),
            child: CachedNetworkImage(
              imageUrl: photo.urls.regular,
              placeholder: (context, urls) => Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; // Keep the widget alive
}
