import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unsplash/services/log_service.dart';

import '../controllers/collections_photos_controller.dart';
import '../models/collections_photo_model.dart';

class CollectionsPhotosPage extends StatefulWidget {
  final String? id;
  final String? title;

  const CollectionsPhotosPage({super.key, required this.id, this.title});

  @override
  State<CollectionsPhotosPage> createState() => _CollectionsPhotosPageState();
}

class _CollectionsPhotosPageState extends State<CollectionsPhotosPage> {
  final controller = Get.find<CollectionsPhotosController>();

  @override
  void initState() {
    super.initState();
    controller.id = widget.id!;
    controller.title = widget.title!;
    controller.apiCollectionPhotos();

    controller.scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CollectionsPhotosController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            surfaceTintColor: Colors.white,
            title: Text(
              widget.title!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.only(left: 5),
            child: MasonryGridView.count(
              controller: controller.scrollController,
              itemCount: controller.collectionPhotos.length,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return itemOfPhoto(controller.collectionPhotos[index]);
              },
            ),
          ),
        );
      },
    );
  }

  Widget itemOfPhoto(CollectionsPhoto photo) {
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
}
