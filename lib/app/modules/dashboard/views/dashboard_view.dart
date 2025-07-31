import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ghost_office/generated/locales.g.dart';
import '../../../data/config/app_colors.dart';
import '../../../ui/components/app_bar_common.dart';
import '../controllers/dashboard_controller.dart';

/// Dashboard View
class DashboardView extends GetView<DashboardController> {
  /// Constructor for DashboardView
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.kffffff,
        appBar: AppBarCommon(
          title: LocaleKeys.dashboard.tr,
          canShowBack: false,
        ),
        body: Align(
          alignment: Alignment.topLeft,
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[],
          ),
        ),
      );
}
