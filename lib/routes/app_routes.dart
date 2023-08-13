import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mexican_food_recipes/screens/home_screen.dart';
import 'package:mexican_food_recipes/screens/meal_screen.dart';
import 'package:mexican_food_recipes/screens/splash_screen.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: SplashScreen.routeName,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: HomeScreen.routeName,
        page: () => const HomeScreen(),
      ),
      GetPage(
        name: MealScreen.routeName,
        page: () =>  MealScreen(),
      ),
    ];
  }
}
