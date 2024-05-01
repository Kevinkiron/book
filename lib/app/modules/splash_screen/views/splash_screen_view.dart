import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:machine_test/app/constants/text_style.dart';

import '../../../constants/images_constants.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  SplashScreenView({super.key});
  @override
  final SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                AppImages.cover,
              ),
              height: 200,
              width: 300,
            ),
            const Gap(20),
            Kstyles().reg(
                text: 'Books',
                color: Colors.blueAccent,
                size: 20,
                fontWeight: FontWeight.bold)
          ],
        ),
      ),
    );
  }
}
