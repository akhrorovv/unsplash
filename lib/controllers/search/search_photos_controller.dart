import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/main_controller.dart';
import 'package:unsplash/controllers/search/search_controller.dart';
import 'package:unsplash/models/search/search_photo_model.dart';

import '../../models/details_photo_model.dart';
import '../../pages/details_photo_page.dart';
import '../../services/http_service.dart';
import '../../services/log_service.dart';

class SearchPhotosController extends GetxController {
  String? query = '';

  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  List<SearchPhoto> searchPhotos = [];
  late DetailsPhoto? photo;

  apiSearchPhotos(String? q) async {
    if (isLoading) return;
    isLoading = true;

    if (q != null && q.isNotEmpty) {
      try {
        LogService.i("Making API request for query: $q, Page: $currentPage");

        var response = await Network.GET(
          Network.API_SEARCH_PHOTOS,
          Network.paramsSearching(q, currentPage),
        );
        LogService.i("Response: $response");

        List<SearchPhoto> newPhotos = searchPhotoFromJson(response!).results;

        if (newPhotos.isNotEmpty) {
          searchPhotos.addAll(newPhotos);
          LogService.i("Added ${newPhotos.length} new photos");
          currentPage++;
          update();
        } else {
          LogService.w("No more photos found");
        }
        LogService.i("Total photos: ${searchPhotos.length}");
      } catch (e) {
        LogService.e("ERROR: $e");
      } finally {
        isLoading = false;
      }
    } else {
      LogService.w("Query is empty");
    }
  }

  scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
              scrollController.offset &&
          !isLoading) {
        if (query != null && query!.isNotEmpty) {
          LogService.d("Query during scroll: $query");
          apiSearchPhotos(query);
        } else {
          LogService.e("Scroll triggered, but query is null or empty");
        }
      }
    });
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
