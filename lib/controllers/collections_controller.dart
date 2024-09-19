import 'package:get/get.dart';
import 'package:unsplash/pages/collections_photos_page.dart';

import '../models/collection_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CollectionsController extends GetxController {
  List<Collection> collections = [];

  apiCollections() async {
    try {
      var response = await Network.GET(
          Network.API_COLLECTIONS, Network.paramsCollections());

      collections.addAll(Network.parseCollections(response!));
      update();

      LogService.d(collections.length.toString());
    } catch (e) {
      LogService.e(e.toString());
    }
  }

  callPhotosPage(String id, String title) {
    Get.to(CollectionsPhotosPage(id: id, title: title));
  }
}
