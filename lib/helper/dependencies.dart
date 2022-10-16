import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_sgpgapp/controllers/auth_controller.dart';
import 'package:my_sgpgapp/controllers/cart_controller.dart';
import 'package:my_sgpgapp/controllers/drinkware_controller.dart';
import 'package:my_sgpgapp/data/api/api_client.dart';
import 'package:my_sgpgapp/data/repository/auth_repo.dart';
import 'package:my_sgpgapp/data/repository/drinkware_repo.dart';
import 'package:my_sgpgapp/utils/app_constants.dart';

import '../controllers/others_controller.dart';
import '../controllers/user_controller.dart';
import '../data/repository/cart_repo.dart';
import '../data/repository/others_repo.dart';
import '../data/repository/user_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(apiClient: Get.find()));

  //repos
  Get.lazyPut(() => DrinkwareRepo(apiClient: Get.find()));
  Get.lazyPut(() => OtherProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo(sharedPreferences: Get.find()));

  //controller
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => DrinkwareController(drinkwareRepo: Get.find()));
  Get.lazyPut(() => OtherProductController(otherProductRepo: Get.find()));
  Get.lazyPut(
    () => CartController(cartRepo: Get.find()),
  );
}
