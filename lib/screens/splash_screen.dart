import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mexican_food_recipes/controllers/meals_controller.dart';
import 'package:mexican_food_recipes/screens/home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2),(){
      Get.offAllNamed(HomeScreen.routeName);
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo/mexican_logo.png',
                height: 150,
                width: 150,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Mexican Guy',
                style: TextStyle(
                  fontFamily: 'Ruwudu',
                  fontSize: 32,
                  color: Color(0xFF272829),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),

    );
  }
}
