import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/collections_photo_model.dart';
import '../models/details_photo_model.dart';
import '../pages/details_photo_page.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CollectionsPhotosController extends GetxController {
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  List<CollectionsPhoto> collectionPhotos = [];
  late DetailsPhoto? photo;
  late String id;
  late String title;

  scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
              scrollController.offset &&
          !isLoading) {
        apiCollectionPhotos();
      }
    });
  }

  apiCollectionPhotos() async {
    if (isLoading) return;
    isLoading = true;

    try {
      var response = await Network.GET(
        Network.API_COLLECTIONS_PHOTOS.replaceFirst(':id', id),
        Network.paramsCollectionsPhotos(currentPage),
      );

      List<CollectionsPhoto> newCollectionPhotos =
          Network.parseCollectionsPhotos(response!);

      if (newCollectionPhotos.isNotEmpty) {
        collectionPhotos.addAll(newCollectionPhotos);
        currentPage++;
        update();
      } else {
        LogService.w("No more photos to load");
      }

      LogService.d("Collection Photos Length: ${collectionPhotos.length}");
    } catch (e) {
      LogService.e("ERROR: $e");
    } finally {
      isLoading = false;
    }
  }

  callDetailsPhotoPage(String id) async {
    try {
      var response = await Network.GET(
        Network.API_PHOTO.replaceFirst(':id', id),
        Network.paramsPhoto(),
      );

      photo = Network.parseDetailsPhoto(response!);
      update();

      LogService.d(response.toString());
    } catch (e) {
      LogService.e(e.toString());
    }

    Get.to(DetailsPhotoPage(photo: photo));
  }
}
