import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/search/search_photos_controller.dart';
import 'package:unsplash/services/log_service.dart';
import 'package:unsplash/widgets/search_photo_widget.dart';

import '../../widgets/empty_widget.dart';

class SearchPhotosPage extends StatefulWidget {
  final String query;

  const SearchPhotosPage({super.key, required this.query});

  @override
  State<SearchPhotosPage> createState() => _SearchPhotosPageState();
}

class _SearchPhotosPageState extends State<SearchPhotosPage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<SearchPhotosController>();

  @override
  void initState() {
    super.initState();

    // Ensure widget.query is not null or empty before assigning
    if (widget.query.isNotEmpty) {
      controller.query = widget.query;
      controller.apiSearchPhotos(controller.query!);
    } else {
      LogService.w("Search query is empty in initState");
    }

    controller.scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call this for AutomaticKeepAliveClientMixin
    return GetBuilder<SearchPhotosController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: controller.searchPhotos.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: MasonryGridView.count(
                    controller: controller.scrollController,
                    itemCount: controller.searchPhotos.length,
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 2,
                    itemBuilder: (context, index) {
                      return itemOfPhoto(controller.searchPhotos[index], controller);
                    },
                  ),
                )
              : emptyWidget(context),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true; // Keep the widget alive
}
