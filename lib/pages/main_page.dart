import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  final controller = Get.find<MainController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return SafeArea(
          child: AnnotatedRegion(
            value: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarIconBrightness: Brightness.dark,
            ),
            child: Scaffold(
              backgroundColor: Colors.white,
              body: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    TabBar(
                      controller: controller.tabController,
                      // indicatorColor: const Color.fromRGBO(0, 135, 0, 1),
                      indicatorColor: Colors.black,
                      // labelColor: const Color.fromRGBO(0, 135, 0, 1),
                      labelColor: Colors.black,
                      unselectedLabelColor: const Color.fromRGBO(69, 71, 69, 1),
                      dividerHeight: 2,
                      tabs: [
                        Container(
                          height: 40,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "HOME",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: double.infinity,
                          child: const Center(
                            child: Text(
                              "COLLECTIONS",
                              style: TextStyle(
                                fontSize: 14,
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
                        children: controller.pages,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
