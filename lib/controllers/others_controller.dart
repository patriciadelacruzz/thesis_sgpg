import 'package:get/get.dart';
import 'package:my_sgpgapp/models/products_model.dart';
import '../data/repository/others_repo.dart';

class OtherProductController extends GetxController {
  final OtherProductRepo otherProductRepo;
  OtherProductController({required this.otherProductRepo});
  List<dynamic> _otherProductList = [];
  List<dynamic> get otherProductList => _otherProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getOtherProductList() async {
    Response response = await otherProductRepo.getOtherProductList();
    if (response.statusCode == 200) {
      _otherProductList = [];
      _otherProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {
      print('could not get products');
    }
  }
}
