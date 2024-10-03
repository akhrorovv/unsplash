import 'package:get/get.dart';
import 'package:unsplash/controllers/collections_controller.dart';
import 'package:unsplash/controllers/collections_photos_controller.dart';
import 'package:unsplash/controllers/home_controller.dart';
import 'package:unsplash/controllers/main_controller.dart';
import 'package:unsplash/controllers/search/search_collections_controller.dart';
import 'package:unsplash/controllers/search/search_controller.dart';
import 'package:unsplash/controllers/search/search_photos_controller.dart';

import '../controllers/search/search_users_controller.dart';

class RootBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CollectionsController(), fenix: true);
    Get.lazyPut(() => CollectionsPhotosController(), fenix: true);
    Get.lazyPut(() => SearchesController(), fenix: true);
    Get.lazyPut(() => SearchPhotosController(), fenix: true);
    Get.lazyPut(() => SearchCollectionsController(), fenix: true);
    Get.lazyPut(() => SearchUsersController(), fenix: true);
  }
}
