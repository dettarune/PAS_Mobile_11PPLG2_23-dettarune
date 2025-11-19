import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:pas_mobile_11pplg2_23/controllers/bottomnav_controller.dart';

class BottomNav extends StatelessWidget {
  final BottomNavController bottomController = Get.put(BottomNavController());

  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Scaffold(
        body: bottomController.pages[bottomController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: bottomController.changePage,
          currentIndex: bottomController.selectedIndex.value,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black54,
          backgroundColor: const Color(0xFF5CB3B3),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.task_alt_sharp),
              label: "TV Show",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: "Bookmark",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
