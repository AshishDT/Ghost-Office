import 'package:get/get.dart';

import '../../../data/repositories/app_info_repo.dart';
import '../../../routes/app_pages.dart';

/// Splash Controller
class SplashController extends GetxController {
  /// On Init
  @override
  void onInit() {
    AppInfoRepo.initPackageInfo();

    Future<void>.delayed(
      const Duration(seconds: 1),
      () {
        Get.offAllNamed(Routes.INTRO);
      },
    );
    super.onInit();
  }

  /// On ready
  @override
  void onReady() {
    super.onReady();
  }

  /// On close
  @override
  void onClose() {
    super.onClose();
  }
}
