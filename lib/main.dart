import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ghost_office/app/data/config/app_themes.dart';
import 'package:ghost_office/app/data/config/error_handling.dart';
import 'package:ghost_office/app/data/config/initialize_app.dart';
import 'package:ghost_office/app/data/config/translation_api.dart';
import 'package:ghost_office/app/data/local/locale_provider.dart';
import 'app/data/config/design_config.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      Get.put(AppTranslations());
      TranslationApi.loadTranslations();
      await initializeCoreApp();
      runApp(
        const StartTheApp(),
      );
    },
    (Object error, StackTrace trace) {
      letMeHandleAllErrors(error, trace);
    },
  );

  // Restrict orientation to Portrait
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}

/// App starter
class StartTheApp extends StatelessWidget {
  /// Constructor
  const StartTheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(
          DesignConfig.kDesignWidth,
          DesignConfig.kDesignHeight,
        ),
        builder: (BuildContext context, Widget? w) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ghost Office',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          translationsKeys: Get.find<AppTranslations>().keys,
          translations: Get.find<AppTranslations>(),
          locale: LocaleProvider.currentLocale,
          builder: EasyLoading.init(),
          fallbackLocale: const Locale('en_US'),
          defaultTransition: Transition.cupertino,
          theme: AppThemes.lightTheme,
        ),
      );
}
