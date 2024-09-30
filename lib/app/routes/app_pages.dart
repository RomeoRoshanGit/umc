import 'package:get/get.dart';

import '../modules/main_page/bindings/main_page_binding.dart';
import '../modules/main_page/views/main_page_view.dart';
import '../modules/next_innings/bindings/next_innings_binding.dart';
import '../modules/next_innings/views/next_innings_view.dart';
import '../modules/over_selection/bindings/over_selection_binding.dart';
import '../modules/over_selection/views/over_selection_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.OVER_SELECTION,
      page: () => const OverSelectionView(),
      binding: OverSelectionBinding(),
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => const MainPageView(),
      binding: MainPageBinding(),
    ),
    GetPage(
      name: _Paths.NEXT_INNINGS,
      page: () => const NextInningsView(),
      binding: NextInningsBinding(),
    ),
  ];
}
