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

  void fetchProduct() async {
    final url = Uri.parse("${NetworkApi.baseUrlTV}/shows");
    final angka =1;

    final res = await http.get(url);

    if (res.statusCode == 200) {

      final data = jsonDecode(res.body);
      final List productData = data;

      productResponse.assignAll(
        productData.map((e) => TvShowList.fromJson(e)).toList(),
      );
    } else {
      Get.snackbar(
        "Informasi",
        "Gagal Fetch Data",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      print("GAGAL FETCH WOI ");
    }
  }
}
