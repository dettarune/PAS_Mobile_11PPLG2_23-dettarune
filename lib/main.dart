import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:pas_mobile_11pplg2_23/bindings/app_binding.dart';
import 'package:pas_mobile_11pplg2_23/routes/pages.dart';
import 'package:pas_mobile_11pplg2_23/routes/routes.dart';

void main()  async{
  runApp(const MyApp());

  await dotenv.load(fileName: '.env');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRoutes.mainMenuPage,
      getPages: AppPages.pages,
      initialBinding: AppBinding(),
    );
  }
}
