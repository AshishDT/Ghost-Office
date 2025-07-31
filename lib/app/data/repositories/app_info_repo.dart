import 'dart:async';
import 'package:package_info_plus/package_info_plus.dart';
import '../config/logger.dart';

/// App Info Repository
class AppInfoRepo {
  /// App Version
  static String version = '---';

  /// Initialize Package Info and Check for Updates
  static Future<void> initPackageInfo() async {
    try {
      final PackageInfo info = await PackageInfo.fromPlatform();
      version = '${info.version}+${info.buildNumber}';
    } on Exception catch (e) {
      version = '---';
      logWTF('Error in init package info ==== $e');
    }
  }
}
