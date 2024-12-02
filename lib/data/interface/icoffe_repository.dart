import 'package:coffee_shop/model/cofee_model.dart';

abstract class ICoffeRepository {
  Future<List<CoffeModel>> getallproducts();
  Future<CoffeModel?>getaSingleProduct(int id);
}
