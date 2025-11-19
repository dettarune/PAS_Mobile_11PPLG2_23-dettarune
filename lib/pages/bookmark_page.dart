import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_23/controllers/bookmark_controller.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});

  final controller = Get.find<BookmarkController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bookmark")),
      body: Obx(() {
        if (controller.bookmarks.isEmpty) {
          return const Center(child: Text("Belum ada bookmark"));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: controller.bookmarks.length,
          itemBuilder: (context, index) {
            final item = controller.bookmarks[index];

            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                    color: Colors.black.withOpacity(0.08),
                  ),
                ],
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      bottomLeft: Radius.circular(12),
                    ),
                    child: Image.network(
                      item.image,
                      width: 100,
                      height: 130,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stack) => Container(
                        width: 100,
                        height: 130,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.broken_image, size: 30),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const SizedBox(height: 6),

                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              item.language.toUpperCase(),
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue.shade700,
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          if (item.rating != null && item.rating! > 0)
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.amber, size: 18),
                                const SizedBox(width: 4),
                                Text(
                                  item.rating!.toStringAsFixed(1),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      controller.toggleBookmark(item);
                    },
                    icon: const Icon(Icons.delete, color: Colors.red),
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
