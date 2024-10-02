import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/search/search_photos_controller.dart';
import 'package:unsplash/services/log_service.dart';
import 'package:unsplash/widgets/search_photo_widget.dart';

class SearchPhotosPage extends StatefulWidget {
  final String? query;

  const SearchPhotosPage({super.key, this.query});

  @override
  State<SearchPhotosPage> createState() => _SearchPhotosPageState();
}

class _SearchPhotosPageState extends State<SearchPhotosPage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<SearchPhotosController>();

  @override
  void initState() {
    super.initState();

    controller.query = widget.query ?? '';
    controller.apiSearchPhotos(controller.query.toString());
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
                      return itemOfPhoto(
                          controller.searchPhotos[index], controller);
                    },
                  ),
                )
              : Center(
                  child: Text('No photos'),
                ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true; // Keep the widget alive
}
