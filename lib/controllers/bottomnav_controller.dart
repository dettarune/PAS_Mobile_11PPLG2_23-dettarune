import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_23/pages/profile_page.dart';
import 'package:pas_mobile_11pplg2_23/pages/tv_show_page.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> pages = [
    TvShowPage(),
    TvShowPage(),
    ProfilePage()
  ];

  void changePage(int index) {
    selectedIndex.value = index;
  }
}