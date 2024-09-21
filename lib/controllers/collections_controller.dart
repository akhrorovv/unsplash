import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash/pages/collections_photos_page.dart';

import '../models/collection_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CollectionsController extends GetxController {
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  List<Collection> collections = [];

  scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent <=
              scrollController.offset &&
          !isLoading) {
        apiCollections();
      }
    });
  }

  apiCollections() async {
    if (isLoading) return;
    isLoading = true;

    try {
      var response = await Network.GET(
          Network.API_COLLECTIONS, Network.paramsCollections(currentPage));

      List<Collection> newCollections = Network.parseCollections(response!);

      if (newCollections.isNotEmpty) {
        collections.addAll(newCollections);
        currentPage++;
        update();
      } else {
        LogService.w("No more photos to load");
      }

      LogService.d(collections.length.toString());
    } catch (e) {
      LogService.e("ERROR: $e");
    } finally {
      isLoading = false;
    }
  }

  callPhotosPage(String id, String title) {
    Get.to(CollectionsPhotosPage(id: id, title: title));
  }
}
