import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:unsplash/controllers/home_controller.dart';
import 'package:unsplash/models/photo_model.dart';

Widget itemOfPhoto(Photo photo, HomeController controller) {
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
