import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_23/controllers/auth_controller.dart';
import 'package:pas_mobile_11pplg2_23/controllers/bookmark_controller.dart';
import 'package:pas_mobile_11pplg2_23/controllers/bottomnav_controller.dart';
import 'package:pas_mobile_11pplg2_23/controllers/tv_show_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<TvShowController>(() => TvShowController(), fenix: true);
    Get.lazyPut<BottomNavController>(() => BottomNavController(), fenix: true);
    Get.lazyPut<BookmarkController>(() => BookmarkController(), fenix: true);
  }
}
