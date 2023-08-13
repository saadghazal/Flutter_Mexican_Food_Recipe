import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mexican_food_recipes/bindings/init_bindings.dart';
import 'package:mexican_food_recipes/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await dotenv.load(fileName: '.env');
   runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Mexican Guy',
      debugShowCheckedModeBanner: false,
      initialBinding: InitBindings(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Ubuntu',
        scaffoldBackgroundColor: Colors.white,
      ),
      getPages: AppRoutes.appRoutes(),
    );
  }
}

