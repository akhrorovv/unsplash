import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/search/search_collection_model.dart';
import '../../services/http_service.dart';
import '../../services/log_service.dart';

class SearchCollectionsController extends GetxController {
  String? query = '';

  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  List<SearchCollection> searchCollections = [];

  apiSearchCollections(String? q) async {
    if (isLoading) return;
    isLoading = true;

    if (q != null && q.isNotEmpty) {
      try {
        LogService.i("Making API request for query: $q, Page: $currentPage");

        var response = await Network.GET(
          Network.API_SEARCH_COLLECTIONS,
          Network.paramsSearching(q, currentPage),
        );
        LogService.i("Response: $response");

        List<SearchCollection>? newCollections =
            searchCollectionResFromJson(response!).results;

        if (newCollections!.isNotEmpty) {
          searchCollections.addAll(newCollections);
          LogService.i("Added ${newCollections.length} new photos");
          currentPage++;
          update();
        } else {
          LogService.w("No more photos found");
        }
        LogService.i("Total photos: ${searchCollections.length}");
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
          apiSearchCollections(query);
        } else {
          LogService.e("Scroll triggered, but query is null or empty");
        }
      }
    });
  }
}
