import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_23/models/tv_show_list_model.dart';
import 'package:pas_mobile_11pplg2_23/network/network_api.dart';

class TvShowController extends GetxController {
  var isLoading = false.obs;
  var productResponse = <TvShowList>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProduct();
  }

  Future<void> fetchProduct() async {
    try {
      isLoading.value = true;
      
      final url = Uri.parse("${NetworkApi.baseUrlTV}shows");
      
      final res = await http.get(url);

      if (res.statusCode == 200) {
        final List data = jsonDecode(res.body);

        productResponse.value = data
            .map((e) => TvShowList.fromJson(e))
            .toList();
                
      } else {
        Get.snackbar(
          "Error",
          "Failed to fetch data. Status: ${res.statusCode}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "error: ${e.toString()}",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> refreshData() async {
    await fetchProduct();
  }
}

