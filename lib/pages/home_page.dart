import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
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

  final _key = GlobalKey<ExpandableFabState>();

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
          backgroundColor: Colors.transparent,
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
          floatingActionButtonLocation: ExpandableFab.location,
          floatingActionButton: ExpandableFab(
            key: _key,
            openButtonBuilder: RotateFloatingActionButtonBuilder(
              child: const Icon(Icons.menu),
              fabSize: ExpandableFabSize.regular,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            closeButtonBuilder: DefaultFloatingActionButtonBuilder(
              child: const Icon(Icons.close),
              fabSize: ExpandableFabSize.regular,
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            children: [
              FloatingActionButton.small(
                backgroundColor: Colors.white,
                heroTag: null,
                child: const Icon(Icons.edit),
                onPressed: () {
                  final state = _key.currentState;
                  if (state != null) {
                    debugPrint('isOpen:${state.isOpen}');
                    state.toggle();
                  }
                },
              ),
              FloatingActionButton.small(
                backgroundColor: Colors.white,
                heroTag: null,
                child: const Icon(Icons.search),
                onPressed: () {
                  final state = _key.currentState;
                  if (state != null) {
                    debugPrint('isOpen:${state.isOpen}');
                    state.toggle();
                  }
                  controller.callSearchPage();
                },
              ),
              FloatingActionButton.small(
                backgroundColor: Colors.white,
                heroTag: null,
                child: const Icon(Icons.keyboard_arrow_up_rounded),
                onPressed: () {
                  final state = _key.currentState;
                  if (state != null) {
                    debugPrint('isOpen:${state.isOpen}');
                    state.toggle();
                  }
                  controller.animateTo();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true; // Keep the widget alive
}
