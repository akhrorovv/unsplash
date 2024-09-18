import 'package:get/get.dart';

import '../models/collections_photo_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CollectionsPhotosController extends GetxController {
  List<CollectionsPhoto> collectionPhotos = [];
  late String id;

  apiCollectionPhotos() async {
    try {
      var response = await Network.GET(
        Network.API_COLLECTIONS_PHOTOS.replaceFirst(':id', id),
        Network.paramsCollectionsPhotos(),
      );

      collectionPhotos.addAll(Network.parseCollectionsPhotos(response!));
      update();

      LogService.d(collectionPhotos.length.toString());
    } catch (e) {
      LogService.e(e.toString());
    }
  }
}
