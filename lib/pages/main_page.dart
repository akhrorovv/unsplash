import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  final controller = Get.find<MainController>();

  @override
  void initState() {
    super.initState();

    controller.tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            toolbarHeight: 0,
            backgroundColor: Colors.white,
          ),
          body: DefaultTabController(
            length: 2,
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
                          "HOME",
                          style: TextStyle(
                            fontSize: 14,
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
        );
      },
    );
  }
}
