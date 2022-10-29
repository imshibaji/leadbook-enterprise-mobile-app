import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/themes/app_theme.dart';

import 'app/data/auth.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

Future<void> initialized() async {
  await GetStorage.init();
  await Get.putAsync((() => Auth().init()));
  await dotenv.load(fileName: ".env");
}

void main() async {
  await initialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightMode(),
      darkTheme: AppTheme.darkMode(),
      translationsKeys: AppTranslation.translations,
      locale: Locale('en', 'EN'),
      enableLog: true,
      defaultTransition: Transition.fadeIn,
      opaqueRoute: Get.isOpaqueRouteDefault,
      popGesture: Get.isPopGestureEnable,
      transitionDuration: Get.defaultTransitionDuration,
    ),
  );
}
