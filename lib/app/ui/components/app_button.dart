import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ghost_office/app/data/config/app_images.dart';
import 'package:lottie/lottie.dart';
import '../../data/config/app_colors.dart';
import '../../utils/app_text_style.dart';

/// A customizable elevated button with loading state,
/// disabled state, and smooth animated background color transition.
class AppButton extends StatelessWidget {
  /// Creates a custom button.
  const AppButton({
    required this.name,
    required this.onPressed,
    this.borderSide,
    this.height,
    this.style,
    this.color,
    this.radius,
    this.isLoading = false,
    this.isEnabled = true,
    this.width,
    Key? key,
  }) : super(key: key);

  /// The text to display on the button.
  final String name;

  /// Callback when the button is pressed.
  final void Function() onPressed;

  /// Optional border side for the button.
  final BorderSide? borderSide;

  /// Height of the button (defaults to 56.h).
  final double? height;

  /// Width of the button (defaults to full screen width).
  final double? width;

  /// Optional custom text style.
  final TextStyle? style;

  /// Optional custom background color.
  final Color? color;

  /// Optional border radius (defaults to 28).
  final BorderRadius? radius;

  /// Whether to show the loading animation.
  final bool isLoading;

  /// Whether the button is enabled.
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    final double btnHeight = height ?? 56.h;
    final double btnWidth = width ?? context.width;

    // Determine background color based on state
    final Color bgColor = isLoading
        ? AppColors.kE7E8E9
        : isEnabled
            ? color ?? AppColors.k9DBDF9
            : AppColors.kE7E8E9;

    return GestureDetector(
      onTap: () {
        if (!isEnabled || isLoading) {
          return;
        }
        onPressed.call();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        height: btnHeight,
        width: btnWidth,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: radius ?? BorderRadius.circular(28).r,
          border: borderSide != null
              ? Border.all(
                  color: borderSide!.color,
                  width: borderSide!.width,
                  style: borderSide!.style,
                )
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (!isLoading) ...<Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: style ??
                          AppTextStyle.openRunde(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.k46494E,
                          ),
                    ),
                  ),
                ),
              ],
              if (isLoading) ...<Widget>[
                15.horizontalSpace,
                Center(
                  child: Lottie.asset(
                    AppImages.loader,
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }
}
