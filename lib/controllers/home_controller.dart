import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash/models/details_photo_model.dart';
import 'package:unsplash/pages/details_photo_page.dart';
import 'package:unsplash/pages/search/search_page.dart';

import '../models/photo_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class HomeController extends GetxController {
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  List<Photo> photos = [];
  late DetailsPhoto? photo;

  scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
              scrollController.offset &&
          !isLoading) {
        apiPhotos();
      }
    });
  }

  apiPhotos() async {
    if (isLoading) return;
    isLoading = true;

    try {
      var response = await Network.GET(
        Network.API_PHOTOS,
        Network.paramsPhotos(currentPage),
      );

      List<Photo> newPhotos = Network.parsePhotosList(response!);

      if (newPhotos.isNotEmpty) {
        photos.addAll(newPhotos);
        currentPage++;
        update();
      } else {
        LogService.w("No more photos to load");
      }
      LogService.i(photos.length.toString());
    } catch (e) {
      LogService.e("ERROR: $e");
    } finally {
      isLoading = false;
    }
  }

  animateTo() {
    scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  callSearchPage() {
    Get.to(const SearchPage());
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
