import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_23/routes/routes.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_tf.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final loginPageColor = Colors.lightBlue;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 240,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: loginPageColor.withOpacity(0.4),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login Page',
                      style: TextStyle(
                        fontSize: 42,
                        color: const Color.fromARGB(255, 112, 1, 1),
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              // Login Form Container
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30, 20, 34),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Username Field
                        CustomTextField(
                          controller: controller.username,
                          label: 'Username',
                          hint: 'Enter your username',
                          prefixIcon: Icons.person_outline,
                          isPassword: false,
                        ),
                        const SizedBox(height: 22),

                        // Password Field
                        CustomTextField(
                          controller: controller.password,
                          label: 'Password',
                          hint: 'Enter your password',
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                        ),
                        const SizedBox(height: 14),

                        const SizedBox(height: 28),

                        Obx(
                          () => controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  text: 'Login',
                                  textColor: Colors.white,
                                  bgColor: loginPageColor,
                                  onPressed: () => controller.login(),
                                ),
                        ),
                                                const SizedBox(height: 24),

                        Obx(
                          () => controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  text: 'Register Page',
                                  textColor: Colors.white,
                                  bgColor: loginPageColor,
                                  onPressed: () => Get.offAllNamed(AppRoutes.registerPage) ,
                                ),
                        ),

                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              GestureDetector(
                onTap: () {
                  Get.snackbar(
                    "Sign Up",
                    "Redirecting to sign up page...",
                    snackPosition: SnackPosition.BOTTOM,
                  );
                 Get.to(AppRoutes.registerPage) ;
                },
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: loginPageColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
