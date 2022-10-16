import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/drinkware_controller.dart';
import '../../controllers/others_controller.dart';
import '../../routes/route_helper.dart';
import '../../utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  Future<void> _loadResource() async {
    await Get.find<DrinkwareController>().getDrinkwareProductList();
    await Get.find<OtherProductController>().getOtherProductList();
  }

  @override
  void initState() {
    super.initState();
    _loadResource();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 2))
      ..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(const Duration(seconds: 3),
        () => Get.offNamed(RouteHelper.getInitial()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
              scale: animation,
              child: Center(
                  child: Image.asset("assets/images/logo1.PNG",
                      width: Dimensions.splashImg))),
        ],
      ),
    );
  }
}
