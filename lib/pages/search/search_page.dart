import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/search/search_controller.dart';
import 'package:unsplash/controllers/search/search_photos_controller.dart';
import 'package:unsplash/pages/search/search_collections.dart';
import 'package:unsplash/pages/search/search_photos.dart';
import 'package:unsplash/pages/search/search_users.dart';

import '../../controllers/search/search_collections_controller.dart';
import '../../controllers/search/search_users_controller.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<SearchesController>();
  final searchPhotosController = Get.find<SearchPhotosController>();
  final searchCollectionController = Get.find<SearchCollectionsController>();
  final searchUsersController = Get.find<SearchUsersController>();

  @override
  void initState() {
    super.initState();

    controller.tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchesController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            title: TextField(
              onSubmitted: (query) {
                searchPhotosController.query = query;
                searchCollectionController.query = query;
                searchUsersController.query = query;
                controller.searchPhotos(query);
                searchPhotosController.update();
                searchCollectionController.update();
                searchUsersController.update();
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Montserrat",
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: "Montserrat",
              ),
            ),
          ),
          body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  dividerColor: const Color.fromRGBO(226, 226, 226, 1),
                  controller: controller.tabController,
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: const Color.fromRGBO(69, 71, 69, 1),
                  dividerHeight: 1,
                  splashFactory: NoSplash.splashFactory,
                  tabs: const [
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "PHOTOS",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "COLLECTIONS",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          "USERS",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: controller.tabController,
                    children: [
                      GetBuilder<SearchPhotosController>(
                        builder: (_) {
                          return SearchPhotosPage(
                            query: controller.queryController.text,
                          );
                        },
                      ),
                      GetBuilder<SearchPhotosController>(
                        builder: (_) {
                          return SearchCollections(
                            query: controller.queryController.text,
                          );
                        },
                      ),
                      GetBuilder<SearchPhotosController>(
                        builder: (_) {
                          return SearchUsers(
                            query: controller.queryController.text,
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
