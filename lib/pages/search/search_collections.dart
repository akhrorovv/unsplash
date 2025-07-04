import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search/search_collections_controller.dart';
import '../../models/search/search_collection_model.dart';
import '../../services/log_service.dart';
import '../../widgets/empty_widget.dart';

class SearchCollections extends StatefulWidget {
  final String query;

  const SearchCollections({super.key, required this.query});

  @override
  State<SearchCollections> createState() => _SearchCollectionsState();
}

class _SearchCollectionsState extends State<SearchCollections>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<SearchCollectionsController>();

  @override
  void initState() {
    super.initState();

    // Ensure widget.query is not null or empty before assigning
    if (widget.query.isNotEmpty) {
      controller.query = widget.query;
      controller.apiSearchCollections(controller.query!);
    } else {
      LogService.w("Search query is empty in initState");
    }

    controller.scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call this for AutomaticKeepAliveClientMixin
    return GetBuilder<SearchCollectionsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: controller.searchCollections.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.searchCollections.length,
                    itemBuilder: (context, index) {
                      return itemOfCollection(controller.searchCollections[index]);
                    },
                  ),
                )
              : emptyWidget(context),
        );
      },
    );
  }

  Widget itemOfCollection(SearchCollection collection) {
    return GestureDetector(
      onTap: () {
        controller.callPhotosPage(collection.id ?? '', collection.title ?? '');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        // color: Colors.green,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              height: 40,
              child: Row(
                children: [
                  Container(
                    width: 40,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: collection.user?.profileImage?.medium ?? '',
                      placeholder: (context, urls) => Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    collection.user?.name ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Montserrat",
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 250,
              width: double.infinity,
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: collection.coverPhoto?.urls?.regular ?? '',
                    placeholder: (context, urls) => Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    errorWidget: (context, urls, error) =>
                        const Icon(Icons.error),
                    imageBuilder: (context, imageProvider) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                              Colors.black.withOpacity(0.9),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.5),
                              Colors.black.withOpacity(0.2),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    margin: const EdgeInsets.all(15),
                    // color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          collection.title ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "${collection.totalPhotos.toString()} Photos",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true; // Keep the widget alive
}
