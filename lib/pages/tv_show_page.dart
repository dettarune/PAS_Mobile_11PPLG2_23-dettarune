import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_23/controllers/tv_show_controller.dart';
import 'package:pas_mobile_11pplg2_23/widgets/tv_card.dart';

class TvShowPage extends StatelessWidget {
  const TvShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TvShowController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TV Shows",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.productResponse.isEmpty) {
          return const Center(child: Text("Tidak ada data TV SHOW"));
        }

        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            mainAxisExtent: 280, 
          ),
          itemCount: controller.productResponse.length,
          itemBuilder: (context, index) {
            final item = controller.productResponse[index];
            return TVShowCard(
              tvShowName: item.name,
              language: item.language,
              rating: item.rating.average,
              image: item.image.medium,
              genres: item.genres,
            );
          },
        );
      }),
    );
  }
}
