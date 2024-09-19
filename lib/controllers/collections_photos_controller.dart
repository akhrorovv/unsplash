import 'package:get/get.dart';

import '../models/collections_photo_model.dart';
import '../models/details_photo_model.dart';
import '../pages/details_photo_page.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class CollectionsPhotosController extends GetxController {
  List<CollectionsPhoto> collectionPhotos = [];
  late DetailsPhoto? photo;
  late String id;
  late String title;

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

  callDetailsPhotoPage(String id) async {
    try {
      var response = await Network.GET(
        Network.API_PHOTO.replaceFirst(':id', id),
        Network.paramsCollectionsPhotos(),
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
