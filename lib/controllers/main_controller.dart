import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/collections_page.dart';
import '../pages/home_page.dart';

class MainController extends GetxController {
  bool isLoading = true;
  late TabController tabController;
  List<Widget> pages = [const HomePage(), const CollectionsPage()];
}
