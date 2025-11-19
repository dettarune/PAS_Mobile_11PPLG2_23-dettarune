import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_23/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg2_23/controllers/tv_show_controller.dart';
import 'package:pas_mobile_11pplg2_23/models/bookmark_model.dart';
import 'package:pas_mobile_11pplg2_23/models/tv_show_list_model.dart';


class TVShowCard extends StatelessWidget {
  final String tvShowName;
  final Language language;
  final double? rating;
  final String image;

  const TVShowCard({
    super.key,
    required this.tvShowName,
    required this.language,
    required this.rating,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final bookmarkController = Get.find<BookmarkController>();

    return Obx(() {
      final isSaved = bookmarkController.isBookmarked(tvShowName);

      return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(tvShowName),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(language.toString()),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    bookmarkController.toggleBookmark(
                      BookmarkModel(
                        title: tvShowName,
                        language: language,
                        rating: rating,
                        image: image,
                      ),
                    );
                  },
                  child: Icon(
                    isSaved ? Icons.bookmark : Icons.bookmark_border,
                    color: isSaved ? Colors.orange : Colors.grey,
                  ),
                ),
              ],
            )

          ],
        )
      );
    });
  }
}
