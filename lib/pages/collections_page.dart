import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/collections_controller.dart';

import '../models/collection_model.dart';

class CollectionsPage extends StatefulWidget {
  const CollectionsPage({super.key});

  @override
  State<CollectionsPage> createState() => _CollectionsPageState();
}

class _CollectionsPageState extends State<CollectionsPage> with AutomaticKeepAliveClientMixin {
  final controller = Get.find<CollectionsController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.apiCollections();

    controller.scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call this for AutomaticKeepAliveClientMixin
    return GetBuilder<CollectionsController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView.builder(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              itemCount: controller.collections.length,
              itemBuilder: (context, index) {
                return itemOfCollection(controller.collections[index]);
              },
            ),
          ),
        );
      },
    );
  }

  Widget itemOfCollection(Collection collection) {
    return GestureDetector(
      onTap: () {
        controller.callPhotosPage(collection.id, collection.title);
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
                      imageUrl: collection.user!.profileImage!.medium.toString(),
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
                    collection.user!.name.toString(),
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
                    imageUrl: collection.coverPhoto!.urls!.regular.toString(),
                    placeholder: (context, urls) => Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    errorWidget: (context, urls, error) => const Icon(Icons.error),
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
                          collection.title.toString(),
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
