import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_23/database/db_helper.dart';
import 'package:pas_mobile_11pplg2_23/models/bookmark_model.dart';

class BookmarkController extends GetxController {
  var bookmarks = <BookmarkModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadBookmarks();
  }

  Future<void> loadBookmarks() async {
    final data = await DBHelper.getBookmarks();
    bookmarks.value = data.map((e) => BookmarkModel.fromJson(e)).toList();
  }

  Future<void> toggleBookmark(BookmarkModel item) async {
    final exists = bookmarks.any((e) => e.title == item.title);

    if (exists) {
      await DBHelper.delete(item.title);
    } else {
      await DBHelper.insert(item.toJson());
    }

    await loadBookmarks();
  }

  bool isBookmarked(String title) {
    return bookmarks.any((e) => e.title == title);
  }
}
