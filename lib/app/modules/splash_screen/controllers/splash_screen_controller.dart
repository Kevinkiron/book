import 'package:get/get.dart';
import 'package:machine_test/app/routes/app_pages.dart';

class SplashScreenController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
    navigate();
    super.onInit();
  }

//Delay duration by 4 sec to navigate to home
  navigate() async {
    Future.delayed(
      const Duration(seconds: 4),
      () {
        Get.offAllNamed(Routes.HOME);
      },
    );
  }
}
