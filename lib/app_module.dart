import 'package:coffee_shop/data/repository/coffe_repository.dart';
import 'package:coffee_shop/resources/app_constant.dart'; // Certifique-se de que esta constante esteja definida
import 'package:coffee_shop/resources/app_routers.dart' as Router;
import 'package:coffee_shop/utils/events/enavigations.dart';
import 'package:coffee_shop/view/pages/coffe_detalhe_page.dart';
import 'package:coffee_shop/view/pages/home_page.dart';
import 'package:coffee_shop/view/pages/splash_page.dart';
import 'package:coffee_shop/viewmodel/splash_view_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  final dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10),
  ));
  @override
  void binds(Injector i) {
    i.addLazySingleton<ENavigation>(ENavigation.new);
    i.addLazySingleton<SplashViewModel>(SplashViewModel.new);
    i.addLazySingleton<CoffeRepository>(() => CoffeRepository(dio: dio));
  }

  @override
  void routes(RouteManager r) {
    r.child(
      Router.initialRoute,
      transition: TransitionType.rightToLeftWithFade,
      child: (context) => const SplashPage(),
    );
    r.child(
      Router.homePage,
      child: (context) => const HomePage(),
    );
    r.child(
      Router.coffeDetalhePage,
      transition: TransitionType.rightToLeft,
      child: (context) {
        final int coffeId = Modular.args.data;
        return CoffeDetalhePage(id: coffeId);
      },
    );
  }
}
