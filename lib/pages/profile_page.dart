import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_23/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_23/widgets/custom_button.dart';


class ProfilePage extends StatelessWidget {



  const ProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
      final controller = Get.find<AuthController>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('lib/assets/image/amir.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              "Amir",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 6),
            const Text(
              "@dettarune",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: const ListTile(
                leading: Icon(Icons.school, color: Colors.green),
                title: Text('Kelas'),
                subtitle: Text('XI PPLG 2'),
              ),
            ),
            const SizedBox(height: 12),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: const ListTile(
                leading: Icon(Icons.home, color: Colors.orange),
                title: Text('Alamat'),
                subtitle: Text('Jl. Jend. Soedirman No.24, Kota Yogyakarta'),
              ),
            ),
            const SizedBox(height: 20),
SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Logout",
                    bgColor: Colors.red,
                    textColor: Colors.white,
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: Text("Confirm Logout"),
                          content: Text("Kamu yakin ingin logout?"),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text("Tidak"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.logout();
                              },
                              child: Text("Iya"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),          ],
        ),
      ),
    );
  }
}
