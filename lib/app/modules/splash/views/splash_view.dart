import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:ghost_office/app/data/config/app_colors.dart';
import 'package:ghost_office/app/data/config/app_images.dart';

import '../controllers/splash_controller.dart';

/// Splash View
class SplashView extends GetView<SplashController> {
  /// Constructor
  SplashView({super.key});

  @override
  final SplashController controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.kF8F9F9,
        body: Center(
          child: SvgPicture.asset(
            AppImages.appLogo,
            width: 180.w,
            height: 100.h,
          ),
        ),
      );
}
