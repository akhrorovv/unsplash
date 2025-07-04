import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/search/search_collections_controller.dart';
import 'package:unsplash/controllers/search/search_photos_controller.dart';
import 'package:unsplash/controllers/search/search_users_controller.dart';

class SearchesController extends GetxController {
  final SearchPhotosController photosController = Get.find();
  final SearchCollectionsController collectionsController = Get.find();
  final SearchUsersController usersController = Get.find();
  final TextEditingController queryController = TextEditingController();

  late TabController tabController;

  void searchPhotos(String query) {
    photosController.searchPhotos.clear();
    collectionsController.searchCollections.clear();
    usersController.searchUsers.clear();
    photosController.apiSearchPhotos(query);
    collectionsController.apiSearchCollections(query);
    usersController.apiSearchUsers(query);
  }
}
