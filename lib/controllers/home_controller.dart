import 'package:get/get.dart';
import 'package:unsplash/models/details_photo_model.dart';
import 'package:unsplash/pages/details_photo_page.dart';

import '../models/photo_model.dart';
import '../services/http_service.dart';
import '../services/log_service.dart';

class HomeController extends GetxController {
  List<Photo> photos = [];
  late DetailsPhoto? photo;

  apiPhotos() async {
    try {
      var response = await Network.GET(Network.API_PHOTOS, Network.paramsPhotos());

      photos.addAll(Network.parsePhotosList(response!));
      update();

      LogService.i(photos.length.toString());
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
