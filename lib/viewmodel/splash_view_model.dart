import 'package:coffee_shop/utils/events/enavigations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashViewModel {
  final navigation = Modular.get<ENavigation>();

  navigationToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    navigation.navigateToHomePage();
  }
}
