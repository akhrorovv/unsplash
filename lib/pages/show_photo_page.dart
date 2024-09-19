import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ShowPhotoPage extends StatelessWidget {
  final String id;
  final String imgUrl;
  final int width;
  final int height;

  const ShowPhotoPage({
    super.key,
    required this.id,
    required this.imgUrl,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: AspectRatio(
          aspectRatio:width / height,
          child: Hero(
            tag: id,
            child: CachedNetworkImage(
              imageUrl: imgUrl,
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
      ),
    );
  }
}
