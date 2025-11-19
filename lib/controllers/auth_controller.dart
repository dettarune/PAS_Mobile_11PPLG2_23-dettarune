import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_23/models/login_model.dart';
import 'package:pas_mobile_11pplg2_23/models/register_model.dart';
import 'package:pas_mobile_11pplg2_23/network/network_api.dart';
import 'package:pas_mobile_11pplg2_23/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();

  var loginResponse = Rxn<LoginModel>();
  var registerResponse = Rxn<RegisterModel>();
  var isLoading = false.obs;

  void login() async {
    final usernameToString = username.text.trim();
    final passwordToString = password.text.trim();
    print("Username : ${usernameToString}");
    print("Password : ${passwordToString}");

    final url = Uri.parse("${NetworkApi.baseUrlAuth}/api/latihan/login");

    try {
      isLoading.value = true;

      final res = await http.post(
        url,
        body: {"username": usernameToString, "password": passwordToString},
      );

      if (res.statusCode == 200) {
        final LoginModel loginModel = loginModelFromJson(res.body);
        loginResponse.value = loginModel;
        if (loginModel.status == true) {
          final pref = await SharedPreferences.getInstance();
          pref.setString("token", loginModel.token.toString());

          Get.snackbar(
            "Login Pages",
            loginModel.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

          Get.offNamed(AppRoutes.mainMenuPage);
        } else {
          Get.snackbar(
            "Auth",
            loginModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Login Pages",
          "Login Gagal: Status ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Login Pages",
        "Koneksi Gagal",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error Login: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void register() async {
    final usernameTs = username.text.trim();
    final passwordTs = password.text.trim();
    final fullNameTs = fullName.text.trim();
    final emailTs = email.text.trim();

    final url = Uri.parse(
      "${NetworkApi.baseUrlAuth}/api/latihan/register-user",
    );

    try {
      isLoading.value = true;

      final res = await http.post(
        url,
        body: {
          "username": usernameTs,
          "password": passwordTs,
          "full_name": fullNameTs,
          "email": emailTs,
        },
      );

      if (res.statusCode == 200) {
        final RegisterModel registerModel = registerModelFromJson(res.body);
        registerResponse.value = registerModel;

        if (registerModel.status == true) {
          Get.snackbar(
            "Register Pages",
            registerModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );

          username.clear();
          password.clear();
          isLoading.value = false;
          Get.offNamed(AppRoutes.loginPage);
        } else {
          Get.snackbar(
            "Register Pages",
            registerModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      } else {
        Get.snackbar(
          "Register Pages",
          "Register Gagal: Status ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Register Pages",
        "Koneksi Gagal",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      print("Error Login: $e");
    } finally {
      isLoading.value == false;
    }
  }

  void logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("token");
    Get.snackbar(
      "Information",
      "Logout successfuly",
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
    Get.offAllNamed(AppRoutes.loginPage);
  }
}
