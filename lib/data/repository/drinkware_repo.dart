import 'package:get/get.dart';
import 'package:my_sgpgapp/data/api/api_client.dart';

import '../../utils/app_constants.dart';

class DrinkwareRepo extends GetxService {
  final ApiClient apiClient;
  DrinkwareRepo({required this.apiClient});

  Future<Response> getDrinkwareProductList() async {
    return await apiClient.getData(AppConstants.DRINKWARE_URI);
  }
}
