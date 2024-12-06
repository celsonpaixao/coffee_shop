import 'package:coffee_shop/resources/app_routers.dart' as routers;
import 'package:coffee_shop/utils/interface/inavigations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ENavigation implements INavigation {
  @override
  Future<void> navigateToHomePage() {
    return Modular.to.pushNamedAndRemoveUntil(routers.homePage, (p0) => false);
  }

  @override
  Future<void> navigateToCoffeDEtalhePage(int id) {
    return Modular.to.pushNamed(routers.coffeDetalhePage, arguments: id);
  }

  @override
  Future<void> goToBack() async {
    Modular.to.pop();
  }
}
