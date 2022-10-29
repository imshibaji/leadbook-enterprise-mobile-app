import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/data/auth.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() async {
  await GetStorage.init();
  await Get.putAsync((() => Auth().init()));

  await dotenv.load(fileName: ".env");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      theme: lightMode(),
      darkTheme: darkMode(),
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

ThemeData lightMode() => ThemeData.from(
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.indigo,
        onPrimary: Color.fromARGB(255, 226, 255, 248),
        secondary: Colors.teal,
        onSecondary: Colors.tealAccent,
        error: Colors.red,
        onError: Colors.redAccent,
        background: Colors.white,
        onBackground: Colors.white,
        surface: Colors.green.shade50,
        onSurface: Colors.indigoAccent.shade400,
      ),
    );

ThemeData darkMode() => ThemeData.from(
      colorScheme: ColorScheme.dark(
        primary: Color(0xFFF7D716),
        onPrimary: Color(0xFF293462),
        secondary: Color(0xFFEC9B3B),
        onSecondary: Color(0xFFF24C4C),
        background: Color.fromARGB(255, 32, 33, 37),
        onBackground: Color.fromARGB(255, 79, 98, 175),
        shadow: Color.fromARGB(255, 79, 98, 175),
      ),
    );
