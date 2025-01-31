import 'package:coffee_shop/app_module.dart';
import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/viewmodel/coffe_detalhe_view_model.dart';
import 'package:coffee_shop/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => CoffeDetalheViewModel(),
        )
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return ModularApp(
            module: AppModule(),
            child: const MyApp(),
          );
        },
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        useMaterial3: true,
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
