import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_sgpgapp/controllers/cart_controller.dart';
import 'package:my_sgpgapp/pages/auth/sign_in_page.dart';
import 'package:my_sgpgapp/pages/auth/sign_up_page.dart';
import 'package:my_sgpgapp/pages/cart/cart_page.dart';
import 'package:my_sgpgapp/pages/products/drinkware_list.dart';
import 'package:my_sgpgapp/pages/products/other_details.dart';
import 'package:my_sgpgapp/pages/home/main_page.dart';
import 'package:my_sgpgapp/pages/splash/splash_page.dart';
import 'package:my_sgpgapp/routes/route_helper.dart';
import 'controllers/drinkware_controller.dart';
import 'controllers/others_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'pages/home/page_body.dart';
//import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<DrinkwareController>(builder: (_) {
      return GetBuilder<OtherProductController>(builder: (_) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            //home: SignInPage(),
            //home: SplashScreen(),
            initialRoute: RouteHelper.getSplashPage(),
            getPages: RouteHelper.routes);
      });
    });
  }
}
