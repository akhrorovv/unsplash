import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/search/search_photos_controller.dart';
import 'package:unsplash/services/log_service.dart';

class SearchesController extends GetxController {
  final SearchPhotosController photosController = Get.find();
  final TextEditingController queryController = TextEditingController();

  late TabController tabController;

  void searchPhotos(String query) {
    photosController.searchPhotos.clear();
    photosController.apiSearchPhotos(query);
  }
}
