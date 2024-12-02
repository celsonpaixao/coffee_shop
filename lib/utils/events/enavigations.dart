import 'package:coffee_shop/resources/app_routers.dart' as Routers;
import 'package:coffee_shop/utils/interface/inavigations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ENavigation implements INavigation {
  @override
  Future<void> navigateToHomePage() {
    return Modular.to.pushNamedAndRemoveUntil(Routers.homePage, (p0) => false);
  }

  @override
  Future<void> navigateToCoffeDEtalhePage(int id) {
    return Modular.to.pushNamed(Routers.coffeDetalhePage, arguments: id);
  }
  
  @override
 goToBack() {
   Modular.to.pop(); 
  }


}
