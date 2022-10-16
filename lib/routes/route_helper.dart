import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:my_sgpgapp/pages/auth/sign_in_page.dart';
import 'package:my_sgpgapp/pages/products/drinkware_list.dart';
import 'package:my_sgpgapp/pages/home/main_page.dart';
import 'package:my_sgpgapp/pages/splash/splash_page.dart';

import '../pages/cart/cart_page.dart';
import '../pages/products/other_details.dart';
import '../pages/home/home_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String drinkwareList = "/drinkware-list";
  static const String othersDetails = "/others-details";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getDrinkwareList(int pageId, String page) =>
      '$drinkwareList?pageId=$pageId&page=$page';
  static String getOtherDetails(int pageId, String page) =>
      '$othersDetails?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
        name: initial,
        page: () {
          return HomePage();
        }),
    GetPage(
        name: signIn,
        page: () {
          return SignInPage();
        },
        transition: Transition.fade),
    GetPage(
        name: drinkwareList,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return DrinkwareList(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: othersDetails,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return OtherDetails(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
