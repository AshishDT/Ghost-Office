import 'package:get/get.dart';

import '../controllers/intro_controller.dart';

/// Intro Binding
class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntroController>(
      () => IntroController(),
    );
  }
}
