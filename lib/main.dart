import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/data/dio_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioBaseService.init();
  runApp(
    GetMaterialApp(
      title: "Books",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, useMaterial3: true),
    ),
  );
}
