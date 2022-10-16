import 'package:get/get.dart';
import 'package:my_sgpgapp/data/api/api_client.dart';

import '../../utils/app_constants.dart';

class OtherProductRepo extends GetxService {
  final ApiClient apiClient;
  OtherProductRepo({required this.apiClient});

  Future<Response> getOtherProductList() async {
    return await apiClient.getData(AppConstants.OTHERS_URI);
  }
}
