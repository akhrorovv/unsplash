import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/search/search_user_model.dart';
import '../../services/http_service.dart';
import '../../services/log_service.dart';

class SearchUsersController extends GetxController {
  String? query = '';
  ScrollController scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 1;
  List<SearchedUser> searchUsers = [];

  apiSearchUsers(String? q) async {
    if (isLoading) return;
    isLoading = true;

    if (q != null && q.isNotEmpty) {
      try {
        LogService.i("Making API request for query: $q, Page: $currentPage");

        var response = await Network.GET(
          Network.API_SEARCH_USERS,
          Network.paramsSearching(q, currentPage),
        );
        LogService.i("Response: $response");

        List<SearchedUser>? newUsers = searchUserResFromJson(response!).results;

        if (newUsers!.isNotEmpty) {
          searchUsers.addAll(newUsers);
          LogService.i("Added ${newUsers.length} new photos");
          currentPage++;
          update();
        } else {
          LogService.w("No more photos found");
        }
        LogService.i("Total photos: ${newUsers.length}");
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
          apiSearchUsers(query);
        } else {
          LogService.e("Scroll triggered, but query is null or empty");
        }
      }
    });
  }
}
