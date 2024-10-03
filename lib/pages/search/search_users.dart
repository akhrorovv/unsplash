import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search/search_users_controller.dart';
import '../../models/search/search_user_model.dart';
import '../../services/log_service.dart';
import '../../widgets/empty_widget.dart';

class SearchUsers extends StatefulWidget {
  final String query;

  const SearchUsers({super.key, required this.query});

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers>
    with AutomaticKeepAliveClientMixin {
  final controller = Get.find<SearchUsersController>();

  @override
  void initState() {
    super.initState();

    // Ensure widget.query is not null or empty before assigning
    if (widget.query.isNotEmpty) {
      controller.query = widget.query;
      controller.apiSearchUsers(controller.query!);
    } else {
      LogService.w("Search query is empty in initState");
    }

    controller.scrollListener();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: controller.searchUsers.isNotEmpty
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.searchUsers.length,
                itemBuilder: (context, index) {
                  return itemOfUser(controller.searchUsers[index]);
                },
              ),
            )
          : emptyWidget(context),
    );
  }

  Widget itemOfUser(SearchedUser user) {
    return GestureDetector(
      onTap: () {
        // controller.callPhotosPage(collection.id ?? '', collection.title ?? '');
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: user.profileImage?.medium ?? '',
                    placeholder: (context, urls) => Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    imageBuilder: (context, imageProvider) =>
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Text(
                      "@${user.username}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                        fontFamily: "Montserrat",
                      ),
                    ),
                  ],
                ),
              ],
            ),
            if(user.photos!.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(left: 65, top: 5),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: user.photos!.length >= 1 ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: user.photos?[0].urls?.regular ?? '',
                        placeholder: (context, urls) => Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        imageBuilder: (context, imageProvider) =>
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      ) : const SizedBox(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: user.photos!.length >= 2 ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: user.photos?[1].urls?.regular ?? '',
                        placeholder: (context, urls) => Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        imageBuilder: (context, imageProvider) =>
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      ) : const SizedBox(),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[300],
                      ),
                      child: user.photos!.length >= 3 ? CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: user.photos?[2].urls?.regular ?? '',
                        placeholder: (context, urls) => Center(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        imageBuilder: (context, imageProvider) =>
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      ) : const SizedBox(),
                    ),
                  ),
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
