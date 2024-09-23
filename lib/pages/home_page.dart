import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:unsplash/controllers/home_controller.dart';

import '../widgets/photo_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    controller.apiPhotos();

    controller.scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Call this for AutomaticKeepAliveClientMixin
    return GetBuilder<HomeController>(
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.only(left: 5),
            child: MasonryGridView.count(
              controller: controller.scrollController,
              itemCount: controller.photos.length,
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 2,
              itemBuilder: (context, index) {
                return itemOfPhoto(controller.photos[index], controller);
              },
            ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true; // Keep the widget alive
}
