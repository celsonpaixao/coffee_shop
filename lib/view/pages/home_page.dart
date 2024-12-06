import 'package:coffee_shop/style/app_colors.dart';
import 'package:coffee_shop/style/app_text_style.dart';
import 'package:coffee_shop/view/widgets/app_global_text.dart';
import 'package:coffee_shop/view/widgets/card_coffe.dart';
import 'package:coffee_shop/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    final viewModel = Provider.of<HomeViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (viewModel.coffes.isEmpty) {
        viewModel.initialize();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              Expanded(child: _buildBody(viewModel)),
            ],
          ),
        ),
      ),
    );
  }
  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppGlobalText(text: "Olá, Celson", style: TextStyleEnum.h2_bold),
          AppGlobalText(
            text: "Qual Café você vai querer hoje ?",
            style: TextStyleEnum.p_medium,
          ),
        ],
      ),
    );
  }

  Container _buildBody(HomeViewModel viewModel) {
    return Container(
      color: Colors.white,
      child: viewModel.isLoading
          ? const Center(
              child: CircularProgressIndicator(
              color: primary,
            ))
          : viewModel.errorMessage != null
              ? Center(child: Text(viewModel.errorMessage!))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: viewModel.coffes.length,
                  itemBuilder: (context, index) {
                    var coffe = viewModel.coffes[index];
                    return CardCoffe(
                      coffe: coffe,
                      onclick: () {
                        viewModel.navigateToDetalhePage(coffe.id!);
                      },
                    );
                  },
                ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.coffee_rounded,
                color: primary,
                size: 30,
              ),
              AppGlobalText(
                text: 'Coffee Shop',
                style: TextStyleEnum.h3_bold,
                color: primary,
              ),
            ],
          ),
          const Icon(
            Icons.menu_rounded,
            color: primary,
            size: 30,
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
