import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:coffee_shop/view/widgets/app_global_text.dart';
import 'package:coffee_shop/viewmodel/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final viewmodel = Modular.get<SplashViewModel>();
  @override
  void initState() {
    viewmodel.navigationToHome();
  }

  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: primary,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.coffee_sharp,
                color: ligth,
                size: 80,
              ),
              AppGlobalText(
                text: "Coffe",
                style: TextStyleEnum.h1_bold,
                color: ligth,
              )
            ],
          ),
        ),
      ),
    );
  }
}
