import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ghost_office/app/data/config/app_colors.dart';
import 'package:ghost_office/app/data/config/app_images.dart';
import 'package:ghost_office/app/utils/widget_ext.dart';
import 'package:ghost_office/generated/locales.g.dart';
import '../../../ui/components/app_button.dart';
import '../../../utils/app_text_style.dart';
import '../controllers/intro_controller.dart';

/// Intro View
class IntroView extends GetView<IntroController> {
  /// Intro constructor
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.kF8F9F9,
        body: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              100.verticalSpace,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SvgPicture.asset(
                    height: 72.h,
                    width: 72.w,
                    AppImages.appLogo,
                  ),
                  16.verticalSpace,
                  Text(
                    LocaleKeys.app_name.tr,
                    style: AppTextStyle.openRunde(
                      fontWeight: FontWeight.w600,
                      fontSize: 40.sp,
                      color: AppColors.k46494E,
                    ),
                  ),
                  52.verticalSpace,
                  Image(
                    height: 248.h,
                    width: 248.w,
                    image: const AssetImage(
                      AppImages.aiTable,
                    ),
                  ),
                  Text(
                    LocaleKeys.intro_text.tr,
                    style: AppTextStyle.openRunde(
                      fontSize: 20.sp,
                      color: AppColors.k787C82,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const Spacer(),
              AppButton(
                onPressed: (){},
                name: 'Start Now',
              ),
              16.verticalSpace,
              AppButton(
                color: AppColors.kE7E8E9,
                onPressed: (){},
                name: 'I Have an Account',
                style: AppTextStyle.openRunde(
                  fontSize: 16.sp,
                  color: AppColors.k787C82,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ).paddingSymmetric(horizontal: 16),
        ),
      ).withGPad(context);
}
