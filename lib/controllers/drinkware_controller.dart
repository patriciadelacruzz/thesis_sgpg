import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_sgpgapp/controllers/cart_controller.dart';
import 'package:my_sgpgapp/data/repository/drinkware_repo.dart';
import 'package:my_sgpgapp/models/products_model.dart';

import '../models/cart_model.dart';
import '../utils/colors.dart';

class DrinkwareController extends GetxController {
  final DrinkwareRepo drinkwareRepo;
  DrinkwareController({required this.drinkwareRepo});
  List<dynamic> _drinkwareProductList = [];
  List<dynamic> get drinkwareProductList => _drinkwareProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getDrinkwareProductList() async {
    Response response = await drinkwareRepo.getDrinkwareProductList();
    if (response.statusCode == 200) {
      _drinkwareProductList = [];
      _drinkwareProductList.addAll(Product.fromJson(response.body).products);

      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      //print("number of items " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      //print("decrement" + _quantity.toString());
    }
    update();
  }

  // _inCartItems = 2;
  // _quantity = 0;
  // _quantity = -2;
  //
  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item Count", "You can't reduce anymore...",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      if (inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item Count", "You can't add anymore...",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //if exist
    //get from storage _inCartItems
    //print("exist or not? " + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    //print("The quantity in the cart is " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("The ID is " +
          value.id.toString() +
          " The quantity is " +
          value.quantity.toString());
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
