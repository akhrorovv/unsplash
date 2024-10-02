import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/main_controller.dart';
import 'package:unsplash/controllers/search/search_controller.dart';
import 'package:unsplash/models/search/search_photo_model.dart';

import '../../services/http_service.dart';
import '../../services/log_service.dart';

class SearchPhotosController extends GetxController {
  // final searchController = Get.find<SearchesController>();

  // Receiving arguments from the previous page
  // final passedData = Get.arguments;
  String? query;

  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  List<SearchPhoto> searchPhotos = [];

  scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
              scrollController.offset &&
          !isLoading) {
        currentPage++;
        apiSearchPhotos(query ?? "");
      }
    });
  }

  apiSearchPhotos(String q) async {
    if (isLoading) return;
    isLoading = true;

    LogService.w(q);

    try {
      var response = await Network.GET(
        Network.API_SEARCH_PHOTOS,
        Network.paramsSearchPhotos(q, currentPage),
      );

      List<SearchPhoto> newPhotos = searchPhotoFromJson(response!).results;

      if (newPhotos.isNotEmpty) {
        searchPhotos.addAll(newPhotos);
        currentPage++;
        update();
      } else {
        LogService.w("No more photos to load");
      }
      LogService.i(searchPhotos.length.toString());
    } catch (e) {
      LogService.e("ERROR: $e");
    } finally {
      isLoading = false;
    }
  }
}
