import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_sgpgapp/pages/home/page_body.dart';
import 'package:my_sgpgapp/utils/dimensions.dart';
import 'package:my_sgpgapp/widgets/big_text.dart';
import 'package:my_sgpgapp/widgets/small_text.dart';

import '../../controllers/drinkware_controller.dart';
import '../../controllers/others_controller.dart';
import '../../utils/colors.dart';
import '../utils/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future<void> _loadResource() async {
    await Get.find<DrinkwareController>().getDrinkwareProductList();
    await Get.find<OtherProductController>().getOtherProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            Container(
                child: Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45, bottom: Dimensions.height15),
              padding: EdgeInsets.only(
                  left: Dimensions.width20, right: Dimensions.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Philippines", color: AppColors.mainColor),
                      Row(
                        children: [
                          SmallText(
                              text: "Metro Manila", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimensions.height45,
                      height: Dimensions.height45,
                      child: Icon(Icons.search,
                          color: Colors.white, size: Dimensions.iconSize24),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  )
                ],
              ),
            )),
            Expanded(
                child: SingleChildScrollView(
              child: BodyPage(),
            )),
          ],
        ),
        onRefresh: _loadResource);
  }
}
