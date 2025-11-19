import 'package:get/route_manager.dart';
import 'package:pas_mobile_11pplg2_23/bindings/app_binding.dart';
import 'package:pas_mobile_11pplg2_23/pages/bottom_nav.dart';
import 'package:pas_mobile_11pplg2_23/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_23/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_23/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_23/pages/tv_show_page.dart';
import 'package:pas_mobile_11pplg2_23/routes/routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.loginPage, page: () => LoginPage(), binding: AppBinding()),
    GetPage(name: AppRoutes.registerPage, page: () => RegisterPage(), binding: AppBinding()),
    GetPage(name: AppRoutes.mainMenuPage, page: () => BottomNav(), binding: AppBinding()),
    GetPage(name: AppRoutes.profilePage, page: () => ProfilePage()),
    GetPage(name: AppRoutes.tvShowPage, page: () => TvShowPage(), binding: AppBinding()),
    
  ];
}